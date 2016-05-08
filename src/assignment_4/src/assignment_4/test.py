max_range = max(ranges0);

simscore = 0
for i in range(len(ranges0)):
    diff = abs(ranges0[i] - ranges1[i])
    simscore += diff
   
simscore = 1 - simscore/ max_range / len(ranges0)
print simscore ** 2

