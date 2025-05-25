# Fast MKCVA for Learning-based NMPC

This repository contains the codes associated with the manuscript: "Fast Mixed Kernel Canonical Variate Analysis for Learning-based Nonlinear Model Predictive Control". (Under Review)

## Usage
The files are recommended to be accessed in the following order:
* [Evap_DAE_Simulate](https://github.com/kspilario/MKCVA_MPC/blob/main/Evap_DAE_Simulate.ipynb) was used to simulate the Evaporator System using Pyomo DAE. This generated the [training](https://github.com/kspilario/MKCVA_MPC/blob/main/evap_seed1.csv) and [validation](https://github.com/kspilario/MKCVA_MPC/blob/main/evap_seed3_valid.csv) data for this case study.
* [Tanks_Scipy_Simulate](https://github.com/kspilario/MKCVA_MPC/blob/main/Tanks_Scipy_Simulate.ipynb) was used to simulate the Three Tanks System using Scipy IVP solver. This generated the [training](https://github.com/kspilario/MKCVA_MPC/blob/main/tanks_seed0_in.csv) and [validation](https://github.com/kspilario/MKCVA_MPC/blob/main/tanks_seed1_in.csv) data for this case study.
* The following files perform System Identification (SysID):
  * SysID on the Evaporator System
    * [Evap_CVA_SysID](https://github.com/kspilario/MKCVA_MPC/blob/main/Evap_CVA_SysID.ipynb) trains CVA and saved as [Evap_CVA](https://github.com/kspilario/MKCVA_MPC/blob/main/evap_cva_sys.pkl).
    * [Evap_MKCVA_SysID](https://github.com/kspilario/MKCVA_MPC/blob/main/Evap_MKCVA_SysID.ipynb) trains MKCVA and saved as [Evap_MKCVA](https://github.com/kspilario/MKCVA_MPC/blob/main/evap_mkcva_sys3.pkl).
    * [Evap_LSTM_SysID](https://github.com/kspilario/MKCVA_MPC/blob/main/Evap_LSTM_SysID.ipynb) trains LSTM and saved as [Evap_LSTM](https://github.com/kspilario/MKCVA_MPC/blob/main/evap_lstm.keras).
  * SysID on the Three Tanks System
    * [Tanks_CVA_SysID](https://github.com/kspilario/MKCVA_MPC/blob/main/Tanks_CVA_SysID.ipynb) trains CVA and saved as [Tanks_CVA](https://github.com/kspilario/MKCVA_MPC/blob/main/tanks_cva_sys.pkl).
    * [Tanks_MKCVA_SysID](https://github.com/kspilario/MKCVA_MPC/blob/main/Tanks_MKCVA_SysID.ipynb) trains MKCVA and saved as [Tanks_MKCVA](https://github.com/kspilario/MKCVA_MPC/blob/main/tanks_mkcva_sys.pkl).
    * [Tanks_LSTM_SysID](https://github.com/kspilario/MKCVA_MPC/blob/main/Tanks_LSTM_SysID.ipynb) trains LSTM and saved as [Tanks_LSTM](https://github.com/kspilario/MKCVA_MPC/blob/main/tanks_lstm.keras).
  * We compared the generalizability of the Evaporator models in [Evap_Compare_SysID](https://github.com/kspilario/MKCVA_MPC/blob/main/Evap_Compare_SysID.ipynb).
  * We compared the generalizability of the Three Tanks models in [Tanks_Compare_SysID](https://github.com/kspilario/MKCVA_MPC/blob/main/Tanks_Compare_SysID.ipynb).
  * Results on the generalizability tests are saved as a [MATLAB Data file](https://github.com/kspilario/MKCVA_MPC/blob/main/compare_models.mat) which can be plotted in MATLAB using [boxplot_sysid](https://github.com/kspilario/MKCVA_MPC/blob/main/boxplot_sysid.m).
* The following files perform Model Predictive Control (MPC) for the Evaporator System:
  * [Evap_CVA_MPC](https://github.com/kspilario/MKCVA_MPC/blob/main/Evap_CVA_MPC.ipynb) uses CVA. Outputs are saved as json files, such as [cva_SPT32_p10_out](https://github.com/kspilario/MKCVA_MPC/blob/main/cva_SPT32_p10_out.json). 
  * [Evap_MKCVA_MPC](https://github.com/kspilario/MKCVA_MPC/blob/main/Evap_MKCVA_MPC.ipynb) uses MKCVA. Outputs are saved as json files, such as [mkcva_SPT32_p10_out](https://github.com/kspilario/MKCVA_MPC/blob/main/mkcva_SPT32_p10_out.json).
  * [Evap_LSTM_MPC](https://github.com/kspilario/MKCVA_MPC/blob/main/Evap_LSTM_MPC.ipynb) uses LSTM. Outputs are saved as json files, such as [lstm_SPT32_p10_out](https://github.com/kspilario/MKCVA_MPC/blob/main/lstm_SPT32_p10_out.json).
* [mpc_plot_figs](https://github.com/kspilario/MKCVA_MPC/blob/main/mpc_plot_figs.m) and [mpc_plot_gifs](https://github.com/kspilario/MKCVA_MPC/blob/main/mpc_plot_gifs.m) makes static plots and GIFs, respectively, from the output json files from the MPC.
* Sample GIFs are available such as [compare_mpc_spt28](https://github.com/kspilario/MKCVA_MPC/blob/main/compare_mpc_spt28.gif) for a setpoint of 28 and [compare_mpc_spt32](https://github.com/kspilario/MKCVA_MPC/blob/main/compare_mpc_spt32.gif) for a setpoint of 32.

## Issues
If you find any issues or have any suggestions for improvement, feel free to contact me via kspilario@up.edu.ph. If any codes are not working on your terminal, let me know. :)
