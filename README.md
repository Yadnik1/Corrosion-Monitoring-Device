# Corrosion-Monitoring-Device
A compact device designed to assess the level of corrosion in steel reinforcing bars within concrete constructions utilizing advanced Pulsed-Eddy Current technology.

Primarily, my work revolved around the algorithm development and validation of the device extensively using MATLAB and on providing wireless iterfacing of the device to a mobile device using Wi-Fi by developing a Flutter Application


## MATLAB scripts

This MATLAB script is designed for processing and analyzing corrosion monitoring data, with a focus on extracting specific characteristics from the dataset. The core application of the script lies in its ability to filter, analyze, and visualize data points based on predefined criteria such as diameter range, liftoff range, and specific data points for slope and intercept calculations. After importing data from an Excel file, the script applies a logarithmic transformation to a subset of the data columns, presumably to normalize the data or to bring out specific features that are more evident on a logarithmic scale. It then selects data rows that fall within specified diameter and liftoff ranges for further analysis.

The algorithm's main functionality revolves around identifying and plotting key characteristics of the corrosion data. It first plots the selected data to provide a visual overview. Then, it calculates additional parameters like the point of a specific y-intercept and the slope between two specified points in the data. These calculations are essential in corrosion monitoring for understanding the rate and nature of corrosion under different conditions. The script employs polynomial fitting to model parts of the data, aiding in understanding trends or patterns in the corrosion process. This analytical approach, combined with gradient calculations and data point identification (like where the gradient reaches a specific value), allows for a detailed examination of the corrosion characteristics, which is crucial for predictive maintenance, assessing material durability, and making informed decisions in various industrial applications.

The script and compiled results in the results.ppt can be found in this folder.
## Flutter Mobile Application 

The main goal of the application is to retrieve the data from the corrosion monitoring device over Wi-Fi. The device creates a local server over the ESP-01 module. Data is constantly updated on the server which the app fetches in real-time.
The mobile application must visualize the data and post process the data to display certain parameters in real-time.

The Flutter application code can be found here: 
