import numpy as np
import pyphi
import scipy.io
from scipy.io import loadmat
from scipy.io import savemat
pyphi.config.PARALLEL_CUT_EVALUATION = False
tpmcell = loadmat('file path')
tpm = np.array(tpmcell['TPM'])
frecell = loadmat('file path')
fre = np.array(frecell['fre'])
phi = np.zeros([63,63])
for num1 in range(0,62):
    for num2 in range(num1+1,63):
        network = pyphi.Network(tpm[num1,num2])
        subsystem = pyphi.Subsystem(network, (0, 0))
        phi00 = pyphi.compute.phi(subsystem)
        subsystem = pyphi.Subsystem(network, (1, 0))
        phi10 = pyphi.compute.phi(subsystem)
        subsystem = pyphi.Subsystem(network, (0, 1))
        phi01 = pyphi.compute.phi(subsystem)
        subsystem = pyphi.Subsystem(network, (1, 1))
        phi11 = pyphi.compute.phi(subsystem)
        phiarray = np.array([phi00,phi10,phi01,phi11])
        phi_by_state = np.array(phiarray)
        phibs_fre = phi_by_state*np.transpose(fre[num1][num2])
        phi[num1][num2] = sum(sum(phibs_fre))


savemat('phi',{'phi':phi})
