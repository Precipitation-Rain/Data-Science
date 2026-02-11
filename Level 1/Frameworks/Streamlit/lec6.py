import streamlit as st

#checkbox
def change():
    print("Changed",end = " ")
    print("to",st.session_state.checker)
state = st.checkbox("I aggreed all terms and conditions",value=False,on_change=change,key='checker')
if state:
    st.write("Welcome to hood")
else:
    pass

#radio utton
st.markdown("---")
#on_change and key also works on the radio butoon
radio_bt =st.radio("In which country you live ?",options=('US','UK','AUS','IND','FRA','RSA'))
print('Raj lives in',radio_bt)

#button
def btn():
    print("Clicked")
btn = st.button("Click me!",on_click=btn)

#select
s_box = st.selectbox("Select the option : ",options = ('a','b','c','d'))
print(s_box)

#multiselect
m_select = st.multiselect("Multiple Select option : ",options=('US','UK','AUS','NZ'))
print(m_select)




