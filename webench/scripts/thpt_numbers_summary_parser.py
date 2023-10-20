# Description:
#   python3 script to analyse and parse the thpt numbers
# Usage:
#   python3 thpt_numbers_summary_parser.py /root/perf/app/thpt/SP
#   python3 thpt_numbers_summary_parser.py /root/perf/app/thpt/NORMAL
# Output:
#   Num of Threads, Avg. Throughput

from os import listdir
from os.path import isfile, join
import sys
import glob

# total arguments
n = len(sys.argv)
print("Total arguments passed:", n)

# Arguments passed
print("\nName of Python script:", sys.argv[0])

print("\nArguments passed:", end = " ")

for i in range(1, n):
    print(sys.argv[i], end = " ")
print('\n')

thptLocation = sys.argv[1]
files = []

for file in glob.iglob(thptLocation + '/*_threads/throughput.csv', recursive=True):
    files.append(file)

files.sort(key = lambda x : int(x.split('_')[2]))

for f in files:
#     print(f)
    lines = []
    thd = f.split('_')[2]
    for line in open(f):
        if line.startswith('Time'):
            continue
        num = float(line.replace('\n', '').split(',')[1])
        lines.append(num)
    avg = sum(lines) / len(lines)
    print(thd, avg)