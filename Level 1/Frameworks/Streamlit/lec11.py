import streamlit as st
import matplotlib.pyplot as plt
import numpy as np

opt = st.sidebar.radio("Select the chart",options=('Line','Bar','H-Bar'))

if opt == 'Line':
    st.markdown(" <h1 style = 'text-align : center';> Line Chart </h1> ",unsafe_allow_html=True)
    fig = plt.figure(figsize=(6,4))
    plt.style.use("https://github.com/dhaitz/matplotlib-stylesheets/raw/master/pitayasmoothie-dark.mplstyle")
    x = np.linspace(0,10,100)
    plt.plot(x,np.sin(x))
    plt.plot(x,np.cos(x),'--')
    st.write(fig)

elif opt == 'Bar':
    st.markdown(" <h1 style = 'text-align : center';> Bar Chart </h1> ",unsafe_allow_html=True)
    fig = plt.figure(figsize=(6,4))
    plt.style.use("https://github.com/dhaitz/matplotlib-stylesheets/raw/master/pitayasmoothie-dark.mplstyle")
    x = np.array([1,2,3,4,5])
    plt.bar(x,x*10)
    st.write(fig)

else:
    st.markdown(" <h1 style = 'text-align : center';> Bar-H Chart </h1> ",unsafe_allow_html=True)
    fig = plt.figure(figsize=(6,4))
    plt.style.use("https://github.com/dhaitz/matplotlib-stylesheets/raw/master/pitayasmoothie-dark.mplstyle")
    x = np.array([1,2,3,4,5])
    plt.barh(x,x*10)   
    st.write(fig)
