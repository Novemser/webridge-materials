import re

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
#     return re.findall(r'q(\d+)_res', s)
    return re.findall(r'RS_q(\d+)_', s)


def isWrite(s):
    s = s.lower()
    return "='insert" in s or "='update" in s


def isQuery(s):
    s = s.lower()
    return 'select' in s or isWrite(s)


def isTxnCommit(s):
    s = s.lower()
    return "='commit" in s or 'set autocommit=1' in s or '======================================================' in s


def isTxnCommitLine(s):
    return '======================================================' in s


def analyseRttsCutByDependency(queryWithDependentInfo, queryWithTypeInfo):
    queryStore = {}
    rtt_write = 0
    rtt_dep = 0
    queryBatch = []
    for queryId in queryWithTypeInfo:
        queryBatch.append(queryId)
        
        # split for write/commit query string, add the batch to store
        if queryWithTypeInfo[queryId]:
            rtt_write += 1
            for batchId in queryBatch:
                queryStore[batchId] = True
            queryBatch.clear()
            # print(queryId)
        else:
            if queryId not in queryWithDependentInfo:
                continue
            depQueryIds = queryWithDependentInfo[queryId]
            if len(depQueryIds) > 0:
                isDepQuery = False
                for depQueryId in depQueryIds:
                    if int(depQueryId) not in queryStore:
                        isDepQuery = True
                        break

                if isDepQuery:
                    rtt_dep += 1
                    for batchId in queryBatch:
                        queryStore[batchId] = True
                    queryBatch.clear()
                    for depQueryId in depQueryIds:
                        if int(depQueryId) not in queryStore:
                            print("WRONG")
    return (rtt_write, rtt_dep, rtt_write + rtt_dep)


def runAnalysis(filePath):
    with open(filePath, 'r') as f:
        queryWithDependentInfo = {}
        queryWithTypeInfo = {}
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
                # split
                # print(isWrite(line),isTxnCommit(line),line)
                if isWrite(line) or isTxnCommit(line):
                    queryWithTypeInfo[curQuery] = True
                else:
                    queryWithTypeInfo[curQuery] = False


            if isCurQueryIdLine(line):
                curQuery = int(line[6:])

            if isQueryStr:
                if isParamLine(line):
                    res = getDependentQueryIds(line)
                    queryWithDependentInfo[curQuery] = res

            if isTxnCommitLine(line):
                curQuery = curQuery + 1
                queryWithTypeInfo[curQuery] = True
    rtt = analyseRttsCutByDependency(queryWithDependentInfo, queryWithTypeInfo)
    print("rtt(write,depQuery,total):", rtt)


fileNames = [
    # 'shopizer/storedprocedure/viewproduct_spwithopt_7.5/view-product/graph-SQLTemplate-all-ver0.sql',
]

for fileName in fileNames:
    print(fileName)
    runAnalysis(fileName)