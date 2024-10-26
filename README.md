# Fast Nonlinear Data-driven MPC using MKCVA

This repository contains the codes associated with the publication ___.

## Usage
The files were created by the author in the following order:
* [Evap_DAE_Simulate](https://github.com/kspilario/MKCVA_MPC/blob/main/Evap_DAE_Simulate.ipynb) was used to simulate the Evaporator System using Pyomo DAE. This generated the [training](https://github.com/kspilario/MKCVA_MPC/blob/main/evap_seed1.csv) and [validation](https://github.com/kspilario/MKCVA_MPC/blob/main/evap_seed3_valid.csv) data.
* The following files perform System Identification (SysID):
  * [Evap_CVA_SysID](https://github.com/kspilario/MKCVA_MPC/blob/main/Evap_CVA_SysID.ipynb) trains a CVA model on the data. This outputs a saved [CVA model](https://github.com/kspilario/MKCVA_MPC/blob/main/evap_cva_sys.pkl).
  * [Evap_MKCVA_SysID](https://github.com/kspilario/MKCVA_MPC/blob/main/Evap_MKCVA_SysID.ipynb) trains an MKCVA model on the data with hyper-parameter tuning. This outputs a saved [MKCVA model](https://github.com/kspilario/MKCVA_MPC/blob/main/evap_mkcva_sys3.pkl).
  * [Evap_LSTM_SysID](https://github.com/kspilario/MKCVA_MPC/blob/main/Evap_LSTM_SysID.ipynb) trains an LSTM model on the data with hyper-parameter tuning. This outputs a saved [LSTM model](https://github.com/kspilario/MKCVA_MPC/blob/main/evap_lstm.keras).
* We now run the Conservative MPC case:
  * [Evap_CVA_MPC_Conservative](https://github.com/kspilario/MKCVA_MPC/blob/main/Evap_CVA_MPC_Conservative.ipynb) uses the CVA model.
  * [Evap_MKCVA_MPC_Conservative](https://github.com/kspilario/MKCVA_MPC/blob/main/Evap_MKCVA_MPC_Conservative.ipynb) uses the MKCVA model.
  * [Evap_LSTM_MPC_Conservative](https://github.com/kspilario/MKCVA_MPC/blob/main/Evap_LSTM_MPC_Conservative.ipynb) uses the LSTM model.
* Then for the Aggressive MPC case:
  * [Evap_CVA_MPC_Aggressive](https://github.com/kspilario/MKCVA_MPC/blob/main/Evap_CVA_MPC_Aggressive.ipynb) uses the CVA model.
  * [Evap_MKCVA_MPC_Aggressive](https://github.com/kspilario/MKCVA_MPC/blob/main/Evap_MKCVA_MPC_Aggressive.ipynb) uses the MKCVA model.
  * [Evap_LSTM_MPC_Aggressive](https://github.com/kspilario/MKCVA_MPC/blob/main/Evap_LSTM_MPC_Aggressive.ipynb) uses the LSTM model.
* [MPC_plotting](https://github.com/kspilario/MKCVA_MPC/blob/main/MPC_plotting.ipynb) makes plots from the output json files from the MPC. Users can style the plot in any way.
* We finally create GIF files to plot the MPC histories in the [Conservative](https://github.com/kspilario/MKCVA_MPC/blob/main/fig_mpc_cons_gif.gif) case and [Aggressive](https://github.com/kspilario/MKCVA_MPC/blob/main/fig_mpc_aggre_gif.gif) case.

## Contributing
If you find any issues or have any suggestions for improvement, feel free to contact me via kspilario@up.edu.ph. If any codes are not working on your terminal, let me know. :)
