# Fast MKCVA for Learning-based NMPC

This repository contains the codes associated with the manuscript: "Fast Mixed Kernel Canonical Variate Analysis for Learning-based Nonlinear Model Predictive Control". (Under Review)

## Usage
The files were created by the author in the following order:
* [Evap_DAE_Simulate](https://github.com/kspilario/MKCVA_MPC/blob/main/Evap_DAE_Simulate.ipynb) was used to simulate the Evaporator System using Pyomo DAE. This generated the [training](https://github.com/kspilario/MKCVA_MPC/blob/main/evap_seed1.csv) and [validation](https://github.com/kspilario/MKCVA_MPC/blob/main/evap_seed3_valid.csv) data.
* The following files perform System Identification (SysID):
  * [Evap_CVA_SysID](https://github.com/kspilario/MKCVA_MPC/blob/main/Evap_CVA_SysID.ipynb) trains a CVA model, saved as [CVA model](https://github.com/kspilario/MKCVA_MPC/blob/main/evap_cva_sys.pkl).
  * [Evap_MKCVA_SysID](https://github.com/kspilario/MKCVA_MPC/blob/main/Evap_MKCVA_SysID.ipynb) trains an MKCVA model, saved as [MKCVA model](https://github.com/kspilario/MKCVA_MPC/blob/main/evap_mkcva_sys3.pkl).
  * [Evap_LSTM_SysID](https://github.com/kspilario/MKCVA_MPC/blob/main/Evap_LSTM_SysID.ipynb) trains an LSTM model, saved as [LSTM model](https://github.com/kspilario/MKCVA_MPC/blob/main/evap_lstm.keras).
* We compare the identified models for interpolation and extrapolation abilities in [Evap_Compare_SysID](https://github.com/kspilario/MKCVA_MPC/blob/main/Evap_Compare_SysID.ipynb). Results are saved in [compare_sysID](https://github.com/kspilario/MKCVA_MPC/blob/main/compare_sysID.csv).
* The following files perform Model Predictive Control (MPC):
  * [Evap_CVA_MPC](https://github.com/kspilario/MKCVA_MPC/blob/main/Evap_CVA_MPC.ipynb) uses CVA. Outputs are saved as json files, such as [cva_SPT32_p10_out](https://github.com/kspilario/MKCVA_MPC/blob/main/cva_SPT32_p10_out.json). 
  * [Evap_MKCVA_MPC](https://github.com/kspilario/MKCVA_MPC/blob/main/Evap_MKCVA_MPC.ipynb) uses MKCVA. Outputs are saved as json files, such as [mkcva_SPT32_p10_out](https://github.com/kspilario/MKCVA_MPC/blob/main/mkcva_SPT32_p10_out.json).
  * [Evap_LSTM_MPC](https://github.com/kspilario/MKCVA_MPC/blob/main/Evap_LSTM_MPC.ipynb) uses LSTM. Outputs are saved as json files, such as [lstm_SPT32_p10_out](https://github.com/kspilario/MKCVA_MPC/blob/main/lstm_SPT32_p10_out.json).
* [MPC_plotting](https://github.com/kspilario/MKCVA_MPC/blob/main/mpc_plotting.m) makes plots from the output json files from the MPC. Users can style the plot in any way.
* We finally create GIF files to plot the MPC histories such as [compare_mpc_spt28](https://github.com/kspilario/MKCVA_MPC/blob/main/compare_mpc_spt28.gif) for a setpoint of 28 and [compare_mpc_spt18](https://github.com/kspilario/MKCVA_MPC/blob/main/compare_mpc_spt18.gif) for a setpoint of 18.

## Issues
If you find any issues or have any suggestions for improvement, feel free to contact me via kspilario@up.edu.ph. If any codes are not working on your terminal, let me know. :)
