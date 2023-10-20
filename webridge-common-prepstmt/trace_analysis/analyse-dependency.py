import re
all_query_cnt = 0
all_dep_query_cnt = 0


def isTemplateStart(s):
    return s.startswith('SymbolicSQLTemplate {') or s.startswith('SQLNode {')


def isTemplateEnd(s):
    return s.startswith('{')


def isSqlTemplate(s):
    return 'sqlTemplate=' in s


def isCurQueryIdLine(s):
    return 'sqlNo=' in s or 'SqlNo=' in s


def isParamLine(s):
    return 'parameters=' in s


def getDependentQueryIds(s):
    return re.findall(r'q(\d+)_res', s)


def isWrite(s):
    s = s.lower()
    return 'insert' in s or 'update' in s


def isQuery(s):
    s = s.lower()
    return 'select' in s or isWrite(s)


def isTxnCommit(s):
    s = s.lower()
    return 'commit' in s or 'set autocommit=1'


def analyseDependency(queryWithDependentInfo):
    global all_dep_query_cnt
    global all_query_cnt
    totalQueryCount = len(queryWithDependentInfo)
    depQueryCount = 0
    for key in queryWithDependentInfo:
        if len(queryWithDependentInfo[key]) > 0:
            depQueryCount += 1
            # print(key, "->", queryWithDependentInfo[key])
    print("totalQueryCount", "depQueryCount", "depQueryCount/totalQueryCount")
    print(totalQueryCount, depQueryCount, depQueryCount / totalQueryCount)
    all_query_cnt += totalQueryCount
    all_dep_query_cnt += depQueryCount


def showNumDependency(queryWithDependentInfo):
    # queries used by later queries
    qCount = {}
    for key in queryWithDependentInfo:
        depQueryIds = queryWithDependentInfo[key]
        if len(depQueryIds) > 0:
            print(key, depQueryIds)
            for id in depQueryIds:
                if id not in qCount:
                    qCount[id] = 1
                else:
                    qCount[id] = qCount[id] + 1
    print(qCount)


def runAnalysis(filePath):
    with open(filePath, 'r') as f:
        queryWithDependentInfo = {}
        isQueryStr = False
        for line in f:
            line = line.strip()
            # reset the state of query str to the initial state
            if isTemplateEnd(line):
                isQueryStr = False

            if isSqlTemplate(line):
                if isQuery(line):
                    isQueryStr = True
                else:
                    isQueryStr = False
            if isCurQueryIdLine(line):
                curQuery = int(line[6:].replace(',',' '))

            if isQueryStr:
                if isParamLine(line):
                    res = getDependentQueryIds(line)
                    queryWithDependentInfo[curQuery] = set(res)
        analyseDependency(queryWithDependentInfo)
    # print(queryWithDependentInfo)
    showNumDependency(queryWithDependentInfo)


fileNames = [
    # './add/SQLTemplate-all.sql',
    # './getCart/SQLTemplate-all.sql',
    # './remove/SQLTemplate-all.sql',
    # './saveNewCustomerPayment/SQLTemplate-all.sql',
    # './updateFulfillmentGroup/SQLTemplate-all.sql',
    # './updateQuantity/SQLTemplate-all.sql',
    # './seo/SQLTemplate-all.sql',
    # './relatedProducts/SQLTemplate-all.sql',
    # './rating/SQLTemplate-all.sql',
    '/home/jpf-web/output_bu/sql/Add/graph-SQLTemplate-all.sql',
    # './breadcrumbs/SQLTemplate-all.sql'
]

for fileName in fileNames:
    print(fileName)
    runAnalysis(fileName)

print(all_query_cnt, all_dep_query_cnt, all_dep_query_cnt / all_query_cnt)