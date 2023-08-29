import random
import argparse
from collections import deque

def twos_complement(n, b):
    if n >= 0:
        binary = bin(n)[2:].zfill(b)
    else:
        binary = bin(abs(n))[2:].zfill(b)
        flipped = ''.join('1' if bit == '0' else '0' for bit in binary)
        binary = bin(int(flipped, 2) + 1)[2:].zfill(b)

    return binary

parser = argparse.ArgumentParser(description='gen44')
parser.add_argument('--A_signed', type=int, default=1,
                    help='activation signed or unsigned')
parser.add_argument('--accumulation', type=int, default=0,
                    help='accumulate last tile')
args = parser.parse_args()

f = open('./configuration/a_bit.txt', 'w')
f.write('01'+'\n')
f = open('./configuration/w_bit.txt', 'w')
f.write('01'+'\n')
f = open('./configuration/strategy.txt', 'w')
f.write('0'+'\n')

f = open('./configuration/A_signed.txt', 'w')
if args.A_signed==1:
  f.write('1'+'\n')
else:
  f.write('0'+'\n')

f = open('./configuration/accumulation.txt', 'w')
if args.accumulation==1:
  f.write('1'+'\n')
else:
  f.write('0'+'\n')

W_ROW = 16*3#SRAM reuse, must be the multiple of 16, most 32*2
DIM = 64*4
A_COL = 32#SRAM reuse, must be the multiple of 2, 4 for maxpooling, most 128*2

f = open('./configuration/num_column.txt', 'w')
f.write(str(twos_complement(int(A_COL), 10))+'\n')
f = open('./configuration/num_row.txt', 'w')
f.write(str(twos_complement(int(W_ROW/16)-1, 3))+'\n')

W = [[0] * DIM for _ in range(W_ROW)]
A = [[0] * A_COL for _ in range(DIM)]
P = [[0] * A_COL for _ in range(W_ROW)]
P_last = [[0] * A_COL for _ in range(W_ROW)]
for i in range(W_ROW):
  for j in range(DIM):
    while True:
      x = int(random.gauss(0, 3))
      if -8 <= x <= 7:
        W[i][j] = int(x)
      break

if args.A_signed==1:
  for i in range(DIM):
    for j in range(A_COL):
      new_A = random.randint(-8, 7)
      if new_A <= 0:
        A[i][j] = 0
      else:
        A[i][j] = new_A
else:
  for i in range(DIM):
    for j in range(A_COL):
      new_A = random.randint(0, 15)
      if new_A <= 0:
        A[i][j] = 0
      else:
        A[i][j] = new_A


f = open('./weight/weight_0.txt', 'w')
for k in range(0, W_ROW, 2):
  W_file = ''
  for t in range(int(DIM)/4):
    W_file = W_file + str(twos_complement(W[k+1][t], 4))
  for t in range(int(DIM)/4):
    W_file = W_file + str(twos_complement(W[k+0][t], 4))
  f.write(W_file+'\n')

f = open('./weight/weight_1.txt', 'w')
for k in range(0, W_ROW, 2):
  W_file = ''
  for t in range(int(DIM)/4, int(DIM)/4*2):
    W_file = W_file + str(twos_complement(W[k+1][t], 4))
  for t in range(int(DIM)/4, int(DIM)/4*2):
    W_file = W_file + str(twos_complement(W[k+0][t], 4))
  f.write(W_file+'\n')

f = open('./weight/weight_2.txt', 'w')
for k in range(0, W_ROW, 2):
  W_file = ''
  for t in range(int(DIM)/4*2, int(DIM)/4*3):
    W_file = W_file + str(twos_complement(W[k+1][t], 4))
  for t in range(int(DIM)/4*2, int(DIM)/4*3):
    W_file = W_file + str(twos_complement(W[k+0][t], 4))
  f.write(W_file+'\n')

f = open('./weight/weight_3.txt', 'w')
for k in range(0, W_ROW, 2):
  W_file = ''
  for t in range(int(DIM)/4*3, DIM):
    W_file = W_file + str(twos_complement(W[k+1][t], 4))
  for t in range(int(DIM)/4*3, DIM):
    W_file = W_file + str(twos_complement(W[k+0][t], 4))
  f.write(W_file+'\n')

f = open('./activation/activation_0.txt', 'w')
for k in range(0, A_COL, 2):
  I_file = ''
  for t in range(0, 64):
    I_file = I_file + str(twos_complement(A[t][k+1], 4))
  for t in range(0, 64):
    I_file = I_file + str(twos_complement(A[t][k+0], 4))
  
  f.write(I_file+'\n')

f = open('./activation/activation_1.txt', 'w')
for k in range(0, A_COL, 2):
  I_file = ''
  for t in range(64, 128):
    I_file = I_file + str(twos_complement(A[t][k+1], 4))
  for t in range(64, 128):
    I_file = I_file + str(twos_complement(A[t][k+0], 4))
  
  f.write(I_file+'\n')

f = open('./activation/activation_2.txt', 'w')
for k in range(0, A_COL, 2):
  I_file = ''
  for t in range(128, 192):
    I_file = I_file + str(twos_complement(A[t][k+1], 4))
  for t in range(128, 192):
    I_file = I_file + str(twos_complement(A[t][k+0], 4))
  
  f.write(I_file+'\n')

f = open('./activation/activation_3.txt', 'w')
for k in range(0, A_COL, 2):
  I_file = ''
  for t in range(192, 256):
    I_file = I_file + str(twos_complement(A[t][k+1], 4))
  for t in range(192, 256):
    I_file = I_file + str(twos_complement(A[t][k+0], 4))
  
  f.write(I_file+'\n')

for s in range(W_ROW):
  for l in range(A_COL):
    P[s][l] = 0
    for u in range(DIM):
      P[s][l] += W[s][u] * A[u][l]

queue = [deque() for _ in range(16)]
for s in range(W_ROW):
  for l in range(A_COL):
    P_last[s][l] = random.randint(-4096, 4095)
    queue[int(s%16)].append(P_last[s][l])

for a in range (16):
  f = open('./last_tile/last_tile'+str(a)+'_0.txt', 'w')
  total = 0
  while(len(queue[a])>0):
    ans = queue[a].popleft()
    ans = str(twos_complement(ans, 32))
    f.write(ans+'\n')
    total = total + 1
    if total==256:
      break
  if len(queue[a])>0:
    f = open('./last_tile/last_tile'+str(a)+'_1.txt', 'w')
    total = 0
    while(len(queue[a])>0):
      ans = queue[a].popleft()
      ans = str(twos_complement(ans, 32))
      f.write(ans+'\n')
      total = total + 1
      if total==256:
        break
  else:
    f = open('./last_tile/last_tile'+str(a)+'_1.txt', 'w')
    f.write('x\n')
  if len(queue[a])>0:
    f = open('./last_tile/last_tile'+str(a)+'_2.txt', 'w')
    total = 0
    while(len(queue[a])>0):
      ans = queue[a].popleft()
      ans = str(twos_complement(ans, 32))
      f.write(ans+'\n')
      total = total + 1
      if total==256:
        break
  else:
    f = open('./last_tile/last_tile'+str(a)+'_2.txt', 'w')
    f.write('x\n')
  if len(queue[a])>0:
    f = open('./last_tile/last_tile'+str(a)+'_3.txt', 'w')
    total = 0
    while(len(queue[a])>0):
      ans = queue[a].popleft()
      ans = str(twos_complement(ans, 32))
      f.write(ans+'\n')
      total = total + 1
      if total==256:
        break
  else:
    f = open('./last_tile/last_tile'+str(a)+'_3.txt', 'w')
    f.write('x\n')

if args.accumulation==1:
  for s in range(W_ROW):
    for l in range(A_COL):
      P[s][l] = P[s][l] + P_last[s][l]

queue = [deque() for _ in range(16)]
for s in range(W_ROW):
  for l in range(A_COL):
    queue[int(s%16)].append(P[s][l])

f = open('./configuration/num_answer.txt', 'w')
f.write(str(twos_complement(256, 10))+'\n')

for a in range (16):
  f = open('./answer/answer'+str(a)+'_0.txt', 'w')
  total = 0
  while(len(queue[a])>0):
    ans = queue[a].popleft()
    ans = str(twos_complement(ans, 32))
    f.write(ans+'\n')
    total = total + 1
    if total==256:
      break
  if len(queue[a])>0:
    f = open('./answer/answer'+str(a)+'_1.txt', 'w')
    total = 0
    while(len(queue[a])>0):
      ans = queue[a].popleft()
      ans = str(twos_complement(ans, 32))
      f.write(ans+'\n')
      total = total + 1
      if total==256:
        break
  else:
    f = open('./answer/answer'+str(a)+'_1.txt', 'w')
    f.write('x\n')
  if len(queue[a])>0:
    f = open('./answer/answer'+str(a)+'_2.txt', 'w')
    total = 0
    while(len(queue[a])>0):
      ans = queue[a].popleft()
      ans = str(twos_complement(ans, 32))
      f.write(ans+'\n')
      total = total + 1
      if total==256:
        break
  else:
    f = open('./answer/answer'+str(a)+'_2.txt', 'w')
    f.write('x\n')
  if len(queue[a])>0:
    f = open('./answer/answer'+str(a)+'_3.txt', 'w')
    total = 0
    while(len(queue[a])>0):
      ans = queue[a].popleft()
      ans = str(twos_complement(ans, 32))
      f.write(ans+'\n')
      total = total + 1
      if total==256:
        break
  else:
    f = open('./answer/answer'+str(a)+'_3.txt', 'w')
    f.write('x\n')
