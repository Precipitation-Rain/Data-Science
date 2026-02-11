import streamlit as st

#slider
def change():
    print("Changed")
val = st.slider("This is a slider",max_value=200,min_value=100,value=150,step=10,on_change=change)
print(val)

#selct_slider
level = st.select_slider(
    "Select difficulty",
    options=["Easy", "Medium", "Hard"]
)
st.write(level)

#text input
input = st.text_input("Enter the text : ",max_chars=20)
print(input)

#text ares
inp = st.text_area("Enter the large text")
print(inp)

# date input
date = st.date_input("Enter the date")
print(date)

#time input
time = st.time_input("Enter the time")
print(time)
