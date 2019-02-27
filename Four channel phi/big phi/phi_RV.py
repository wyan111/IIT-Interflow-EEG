import numpy as np
import pyphi
import scipy.io
from scipy.io import loadmat
from scipy.io import savemat
data = loadmat('/home/wyan111/qb48_scratch/wenqiIIT/four-ch-massive/TPM_RV.mat')
tpm = np.array(data['TPM'])
phi = np.zeros(38)
for num1 in range(0,38):
        network = pyphi.Network(tpm[0,num1])
        subsystem = pyphi.Subsystem(network, (0,0,0,0))
        phi0000 = pyphi.compute.phi(subsystem)
        subsystem = pyphi.Subsystem(network, (1,0,0,0))
        phi1000 = pyphi.compute.phi(subsystem)
        subsystem = pyphi.Subsystem(network, (0,1,0,0))
        phi0100 = pyphi.compute.phi(subsystem)
        subsystem = pyphi.Subsystem(network, (1,1,0,0))
        phi1100 = pyphi.compute.phi(subsystem)
        subsystem = pyphi.Subsystem(network, (0,0,1,0))
        phi0010 = pyphi.compute.phi(subsystem)
        subsystem = pyphi.Subsystem(network, (1,0,1,0))
        phi1010 = pyphi.compute.phi(subsystem)
        subsystem = pyphi.Subsystem(network, (0,1,1,0))
        phi0110 = pyphi.compute.phi(subsystem)
        subsystem = pyphi.Subsystem(network, (1,1,1,0))
        phi1110 = pyphi.compute.phi(subsystem)
        subsystem = pyphi.Subsystem(network, (0,0,0,1))
        phi0001 = pyphi.compute.phi(subsystem)
        subsystem = pyphi.Subsystem(network, (1,0,0,1))
        phi1001 = pyphi.compute.phi(subsystem)
        subsystem = pyphi.Subsystem(network, (0,1,0,1))
        phi0101 = pyphi.compute.phi(subsystem)
        subsystem = pyphi.Subsystem(network, (1,1,0,1))
        phi1101 = pyphi.compute.phi(subsystem)
        subsystem = pyphi.Subsystem(network, (0,0,1,1))
        phi0011 = pyphi.compute.phi(subsystem)
        subsystem = pyphi.Subsystem(network, (1,0,1,1))
        phi1011 = pyphi.compute.phi(subsystem)
        subsystem = pyphi.Subsystem(network, (0,1,1,1))
        phi0111 = pyphi.compute.phi(subsystem)
        subsystem = pyphi.Subsystem(network, (1,1,1,1))
        phi1111 = pyphi.compute.phi(subsystem)
        phiarray = np.array([phi0000,phi1000,phi0100,phi1100,phi0010,phi1010,phi0110,phi1110,phi0001,phi1001,phi0101,phi1101,phi0011,phi1011,phi0111,phi1111])
        phibs_fre = phiarray*np.transpose(tpm[1,num1])
        phi[num1] = sum(sum(phibs_fre))

savemat('phi_RV.mat',{'phi_RV':phi})