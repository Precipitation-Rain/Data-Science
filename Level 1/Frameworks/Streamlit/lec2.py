import streamlit as st

st.text("Hello")

#markdown
st.markdown(" **Hello** ")
st.markdown(" *Hello* ")

st.markdown(" --- ")

st.markdown(" [Google](https://www.google.com) ")

st.markdown(" > Hello ")

st.markdown(" # Hello ")



st.markdown(" ---- ")


#caption
st.caption("Hello i am an caption")

#latex
st.latex(r"\begin{pmatrix}a&b\\c&d\end{pmatrix}")

# markdown and latex


st.markdown(" ---- ")

#json
j = {
    'Name' : "Rajvardhan",
    'PRN' : 2317061
}
st.json(j)


st.markdown(" ---- ")

#code
code = """
a = 10
b = 20

def sum(a , b):
    return a + b

ans = sum(a , b)

print(ans)

"""
st.code(code,language='python')
