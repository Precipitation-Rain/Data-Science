import streamlit as st
import pandas as pd

# write function
st.write("Input text")

#metric
st.metric(label = 'Windspeed' , value = '120ms⁻¹',delta = '1.4ms⁻¹')
st.metric(label = 'Temprature' , value = '20ᴼC',delta = '-2ᴼC')

st.markdown("---")

tab= pd.DataFrame(
    {
        'Column 1' : [1,2,3,4,5],
        'Column 2':[6,7,8,9,0]
    }
)
#table
st.table(tab)

st.markdown("---")

#dataframe
st.dataframe(tab)


