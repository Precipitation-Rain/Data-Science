import streamlit as st
import time as ti
from datetime import time

# progress bar

# bar = st.progress(0)

# for i in range(11):
#     bar.progress(i * 10)
#     time.sleep(1)

# timer app with progress bar
def converter(value):
    m , s ,mm = value.split(":")
    total_second =  int(m)*60 + int(s) + int(mm)  / 1000
    return total_second


val = st.time_input("set timer : ",value=time(0,0,0))

if str(val) == "00:00:00" :
    st.write("Please set time")

else:
    sec = converter(str(val))
    bar = st.progress(0)
    per = sec / 100
    progress_status = st.empty()

    for i in range(100):
        bar.progress(i + 1)
        progress_status.write(str(i + 1) + "%")
        ti.sleep(per)



