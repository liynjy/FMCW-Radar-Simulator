# FMCW-Radar-Simulator
# This project is not funed by any organization.

-----------------------------------------------------  
  Author: Lin Junyang   
  Email : liynjy@163.com  
  WeChat: liynjy
-----------------------------------------------------

1) This is a MATLAB based FMCW RF Radar Simulator. 
2) It generates FMCW radar data for close handwave chirp level signal. 
3) Your can try develop your radar data processing algorithm base on this simulator.
4) As a charllenge, can you develope your algorithm to detect the handwave directions: LEFT or RIGHT.
5) Run main.m in matlab to start trying out.

2020-12-31 Update：
Added an experimental algorithm to detect the handwave direction:
1) Caculating the tangential speed of hand movement -- Vt
2) If Vt>0, hanvewave direction is right; If Vt<0, handwave direction is left.

20220213
According to practical experience, it is more stable to use phase difference algorithm for angle measurement.Handwave direction  can be determined after the angle curve is caculated. 
