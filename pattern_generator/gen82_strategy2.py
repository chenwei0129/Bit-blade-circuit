import random
import argparse

def twos_complement(n, b):
    if n >= 0:
        binary = bin(n)[2:].zfill(b)
    else:
        binary = bin(abs(n))[2:].zfill(b)
        flipped = ''.join('1' if bit == '0' else '0' for bit in binary)
        binary = bin(int(flipped, 2) + 1)[2:].zfill(b)

    return binary

parser = argparse.ArgumentParser(description='gen82')
parser.add_argument('--A_signed', type=int, default=1,
                    help='activation signed or unsigned')
parser.add_argument('--accumulation', type=int, default=0,
                    help='accumulate last tile')
args = parser.parse_args()

f = open('./configuration/a_bit.txt', 'w')
f.write('10'+'\n')
f = open('./configuration/w_bit.txt', 'w')
f.write('00'+'\n')
f = open('./configuration/strategy.txt', 'w')
f.write('1'+'\n')

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

W_ROW = 16#must be the multiple of 16, most 32
DIM = 64
A_COL = 48*4#must be the multiple of 4, 16 for maxpooling, most 128*4

f = open('./configuration/num_column.txt', 'w')
f.write(str(twos_complement(int(A_COL/4), 10))+'\n')
f = open('./configuration/num_row.txt', 'w')
f.write(str(twos_complement(int(W_ROW/16)-1, 3))+'\n')

W = [[0] * DIM for _ in range(W_ROW)]
A = [[0] * A_COL for _ in range(DIM)]
P = [[0] * A_COL for _ in range(W_ROW)]
P_last = [[0] * A_COL for _ in range(W_ROW)]
for i in range(W_ROW):
  for j in range(DIM):
    while True:
      x = int(random.gauss(0, 1.0))
      if -2 <= x <= 1:
        W[i][j] = int(x)
      break

if args.A_signed==1:
  for i in range(DIM):
    for j in range(A_COL):
      new_A = random.randint(-128, 127)
      if new_A <= 0:
        A[i][j] = 0
      else:
        A[i][j] = new_A
else:
  for i in range(DIM):
    for j in range(A_COL):
      new_A = random.randint(0, 255)
      if new_A <= 0:
        A[i][j] = 0
      else:
        A[i][j] = new_A

f = open('./weight/weight_0.txt', 'w')
for k in range(0, W_ROW, 4):
  W_file = ''
  for t in range(DIM):
    W_file = W_file + str(twos_complement(W[k+3][t], 2))
  for t in range(DIM):
    W_file = W_file + str(twos_complement(W[k+2][t], 2))
  for t in range(DIM):
    W_file = W_file + str(twos_complement(W[k+1][t], 2))
  for t in range(DIM):
    W_file = W_file + str(twos_complement(W[k+0][t], 2))
  f.write(W_file+'\n')

f = open('./weight/weight_1.txt', 'w')
for k in range(0, W_ROW, 4):
  W_file = ''
  for t in range(DIM):
    W_file = W_file + str(twos_complement(W[k+3][t], 2))
  for t in range(DIM):
    W_file = W_file + str(twos_complement(W[k+2][t], 2))
  for t in range(DIM):
    W_file = W_file + str(twos_complement(W[k+1][t], 2))
  for t in range(DIM):
    W_file = W_file + str(twos_complement(W[k+0][t], 2))
  f.write(W_file+'\n')

f = open('./weight/weight_2.txt', 'w')
for k in range(0, W_ROW, 4):
  W_file = ''
  for t in range(DIM):
    W_file = W_file + str(twos_complement(W[k+3][t], 2))
  for t in range(DIM):
    W_file = W_file + str(twos_complement(W[k+2][t], 2))
  for t in range(DIM):
    W_file = W_file + str(twos_complement(W[k+1][t], 2))
  for t in range(DIM):
    W_file = W_file + str(twos_complement(W[k+0][t], 2))
  f.write(W_file+'\n')

f = open('./weight/weight_3.txt', 'w')
for k in range(0, W_ROW, 4):
  W_file = ''
  for t in range(DIM):
    W_file = W_file + str(twos_complement(W[k+3][t], 2))
  for t in range(DIM):
    W_file = W_file + str(twos_complement(W[k+2][t], 2))
  for t in range(DIM):
    W_file = W_file + str(twos_complement(W[k+1][t], 2))
  for t in range(DIM):
    W_file = W_file + str(twos_complement(W[k+0][t], 2))
  f.write(W_file+'\n')

f = open('./activation/activation_0.txt', 'w')
for k in range(0, int(A_COL/4)):
  I_file = ''
  for t in range(0, 64):
    I_file = I_file + str(twos_complement(A[t][k], 8))
  
  f.write(I_file+'\n')

f = open('./activation/activation_1.txt', 'w')
for k in range(int(A_COL/4), int(A_COL/4)*2):
  I_file = ''
  for t in range(0, 64):
    I_file = I_file + str(twos_complement(A[t][k], 8))
  
  f.write(I_file+'\n')

f = open('./activation/activation_2.txt', 'w')
for k in range(int(A_COL/4)*2, int(A_COL/4)*3):
  I_file = ''
  for t in range(0, 64):
    I_file = I_file + str(twos_complement(A[t][k], 8))
  
  f.write(I_file+'\n')

f = open('./activation/activation_3.txt', 'w')
for k in range(int(A_COL/4)*3, A_COL):
  I_file = ''
  for t in range(0, 64):
    I_file = I_file + str(twos_complement(A[t][k], 8))
  
  f.write(I_file+'\n')

for s in range(W_ROW):
  for l in range(A_COL):
    P[s][l] = 0
    for u in range(DIM):
      P[s][l] += W[s][u] * A[u][l]

for s in range(W_ROW):
  for l in range(A_COL):
    P_last[s][l] = random.randint(-4096, 4095)

for a in range (16):
  f = open('./last_tile/last_tile'+str(a)+'_0.txt', 'w')
  for b in range(int(A_COL/4)):
    ans = str(twos_complement(P_last[a][b], 32))
    f.write(ans+'\n')

if W_ROW==32:
  for a in range (16, 32):
    f = open('./last_tile/last_tile'+str(a-16)+'_0.txt', 'a')
    for b in range(int(A_COL/4)):
      ans = str(twos_complement(P_last[a][b], 32))
      f.write(ans+'\n')

for a in range (16):
  f = open('./last_tile/last_tile'+str(a)+'_1.txt', 'w')
  for b in range(int(A_COL/4), int(A_COL/4)*2):
    ans = str(twos_complement(P_last[a][b], 32))
    f.write(ans+'\n')

if W_ROW==32:
  for a in range (16, 32):
    f = open('./last_tile/last_tile'+str(a-16)+'_1.txt', 'a')
    for b in range(int(A_COL/4), int(A_COL/4)*2):
      ans = str(twos_complement(P_last[a][b], 32))
      f.write(ans+'\n')

for a in range (16):
  f = open('./last_tile/last_tile'+str(a)+'_2.txt', 'w')
  for b in range(int(A_COL/4)*2, int(A_COL/4)*3):
    ans = str(twos_complement(P_last[a][b], 32))
    f.write(ans+'\n')

if W_ROW==32:
  for a in range (16, 32):
    f = open('./last_tile/last_tile'+str(a-16)+'_2.txt', 'a')
    for b in range(int(A_COL/4)*2, int(A_COL/4)*3):
      ans = str(twos_complement(P_last[a][b], 32))
      f.write(ans+'\n')

for a in range (16):
  f = open('./last_tile/last_tile'+str(a)+'_3.txt', 'w')
  for b in range(int(A_COL/4)*3, A_COL):
    ans = str(twos_complement(P_last[a][b], 32))
    f.write(ans+'\n')

if W_ROW==32:
  for a in range (16, 32):
    f = open('./last_tile/last_tile'+str(a-16)+'_3.txt', 'a')
    for b in range(int(A_COL/4)*3, A_COL):
      ans = str(twos_complement(P_last[a][b], 32))
      f.write(ans+'\n')

if args.accumulation==1:
  for s in range(W_ROW):
    for l in range(A_COL):
      P[s][l] = P[s][l] + P_last[s][l]

f = open('./configuration/num_answer.txt', 'w')
f.write(str(twos_complement(int(A_COL/4)*int(W_ROW/16), 10))+'\n')

for a in range (16):
  f = open('./answer/answer'+str(a)+'_0.txt', 'w')
  for b in range(int(A_COL/4)):
    ans = str(twos_complement(P[a][b], 32))
    f.write(ans+'\n')

if W_ROW==32:
  for a in range (16, 32):
    f = open('./answer/answer'+str(a-16)+'_0.txt', 'a')
    for b in range(int(A_COL/4)):
      ans = str(twos_complement(P[a][b], 32))
      f.write(ans+'\n')

for a in range (16):
  f = open('./answer/answer'+str(a)+'_1.txt', 'w')
  for b in range(int(A_COL/4), int(A_COL/4)*2):
    ans = str(twos_complement(P[a][b], 32))
    f.write(ans+'\n')

if W_ROW==32:
  for a in range (16, 32):
    f = open('./answer/answer'+str(a-16)+'_1.txt', 'a')
    for b in range(int(A_COL/4), int(A_COL/4)*2):
      ans = str(twos_complement(P[a][b], 32))
      f.write(ans+'\n')

for a in range (16):
  f = open('./answer/answer'+str(a)+'_2.txt', 'w')
  for b in range(int(A_COL/4)*2, int(A_COL/4)*3):
    ans = str(twos_complement(P[a][b], 32))
    f.write(ans+'\n')

if W_ROW==32:
  for a in range (16, 32):
    f = open('./answer/answer'+str(a-16)+'_2.txt', 'a')
    for b in range(int(A_COL/4)*2, int(A_COL/4)*3):
      ans = str(twos_complement(P[a][b], 32))
      f.write(ans+'\n')

for a in range (16):
  f = open('./answer/answer'+str(a)+'_3.txt', 'w')
  for b in range(int(A_COL/4)*3, A_COL):
    ans = str(twos_complement(P[a][b], 32))
    f.write(ans+'\n')

if W_ROW==32:
  for a in range (16, 32):
    f = open('./answer/answer'+str(a-16)+'_3.txt', 'a')
    for b in range(int(A_COL/4)*3, A_COL):
      ans = str(twos_complement(P[a][b], 32))
      f.write(ans+'\n')

