import numpy as np
import pyphi
import scipy.io
from scipy.io import loadmat
from scipy.io import savemat
data = loadmat('/Users/soliyan3261/Desktop/two_ch_difference_method_tao_7.8/TM/TPM_TM.mat')
tpm = np.array(data['TPM'])
state00 = (0, 0)
state10 = (1, 0)
state01 = (0, 1)
state11 = (1, 1)
phi_by_state = np.zeros([6,4])
phi = np.zeros(6)
for num1 in range(0,6):
        network = pyphi.Network(tpm[0,num1])
        subsystem = pyphi.Subsystem(network, (0,0))
        phi00 = pyphi.compute.phi(subsystem)
        subsystem = pyphi.Subsystem(network, (1,0))
        phi10 = pyphi.compute.phi(subsystem)
        subsystem = pyphi.Subsystem(network, (0,1))
        phi01 = pyphi.compute.phi(subsystem)
        subsystem = pyphi.Subsystem(network, (1,1))
        phi11 = pyphi.compute.phi(subsystem)
        phiarray = np.array([phi00,phi10,phi01,phi11])
        phi_by_state[num1] = np.array(phiarray)
        phibs_fre = phi_by_state[num1]*tpm[1,num1]
        phi[num1] = sum(sum(phibs_fre))
print(phi)
# savemat('tmWL_phicell',{'phiTMWLcell':phiTMWLcell})
