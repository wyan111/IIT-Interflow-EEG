import numpy as np
import pyphi
import scipy.io
from scipy.io import loadmat
from scipy.io import savemat
data = loadmat('/home/wyan111/qb48_scratch/wenqiIIT/phi/TPM_MDTMRV.mat')
tpm36SBS = np.array(data['TPM_MDTMRV'])
state00 = (0, 0)
state10 = (1, 0)
state01 = (0, 1)
state11 = (1, 1)
phiTMRVMDcell = np.zeros([148,148,4])
for num1 in range(0,148):
    for num2 in range(num1,148):
        tpmSBN = pyphi.convert.state_by_state2state_by_node(tpm36SBS[num1,num2])
        network = pyphi.Network(tpmSBN)
        subsystem = pyphi.Subsystem(network, state00)
        phi00 = pyphi.compute.phi(subsystem)
        subsystem = pyphi.Subsystem(network, state10)
        phi10 = pyphi.compute.phi(subsystem)
        subsystem = pyphi.Subsystem(network, state01)
        phi01 = pyphi.compute.phi(subsystem)
        subsystem = pyphi.Subsystem(network, state11)
        phi11 = pyphi.compute.phi(subsystem)
        phiarray = np.array([phi00,phi10,phi01,phi11])
        phiTMRVMDcell[num1][num2] = np.array(phiarray)


savemat('phiTMRVMDcell',{'phiTMRVMDcell':phiTMRVMDcell})
