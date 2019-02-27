import numpy as np
import pyphi
import scipy.io
import json
from scipy.io import loadmat
from scipy.io import savemat
data = loadmat('/home/wyan111/qb48_scratch/wenqiIIT/four-ch-massive/sia/TPM_OC13.mat')
tpm = np.array(data['TPM'])
strucjson = [0]*38
state=[[0,0,0,0],[1,0,0,0],[0,1,0,0],[1,1,0,0],[0,0,1,0],[1,0,1,0],[0,1,1,0],[1,1,1,0],[0,0,0,1],[1,0,0,1],[0,1,0,1],[1,1,0,1],[0,0,1,1],[1,0,1,1],[0,1,1,1],[1,1,1,1]]
for num1 in range(0,38):
          strucjson[num1] = [0]*16
for num2 in range(0,16):
           network = pyphi.Network(tpm[0,num1])
           subsystem = pyphi.Subsystem(network,state[num2])
           struc = pyphi.compute.sia(subsystem)
           strucjson[num1][num2] = pyphi.jsonify.jsonify(struc)
with open('/home/wyan111/qb48_scratch/wenqiIIT/four-ch-massive/sia/OC_level13.json','w') as outfile:
   json.dump(strucjson, outfile)
