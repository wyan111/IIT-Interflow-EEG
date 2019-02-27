import numpy as np
import pyphi
import scipy.io
import json
from scipy.io import loadmat
from scipy.io import savemat
data = loadmat('/Users/soliyan3261/Desktop/sia_diff/TPM_OC2.mat')
tpm = np.array(data['TPM'])
strucjson = [0]*38
state=[[0,0,0,0],[1,0,0,0],[0,1,0,0],[1,1,0,0],[0,0,1,0],[1,0,1,0],[0,1,1,0],[1,1,1,0],[0,0,0,1],[1,0,0,1],[0,1,0,1],[1,1,0,1],[0,0,1,1],[1,0,1,1],[0,1,1,1],[1,1,1,1]]
for num1 in range(0,2):
         strucjson[num1] = [0]*16
         for num2 in range(0,2):
               network = pyphi.Network(tpm[0,num1])
               subsystem = pyphi.Subsystem(network,state[num2])
               struc = pyphi.compute.sia(subsystem)
               strucjson[num1][num2] = pyphi.jsonify.jsonify(struc)
with open('/Users/soliyan3261/Desktop/OC_level2.json','w') as outfile:
   json.dump(strucjson, outfile)
