import csv
import sys
fileName = sys.argv[1]

totalLat = []

with open(fileName, newline='') as f:
    reader = csv.reader(f)
    data = list(reader)
    # skip the headers
    data = data[1:]
    for line in data:
        totalLat.append(float(line[0]))

# the first half is skipped as warmup data
totalLat = totalLat[len(totalLat)//2:]
totalLat = sorted(totalLat)
length = len(totalLat)

print("p50", totalLat[length//2],
      "p90", totalLat[int(length * 0.9)], "p99", totalLat[int(length * 0.99)])
