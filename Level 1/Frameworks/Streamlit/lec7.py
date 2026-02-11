import streamlit as st

st.title("Uploading files")

#uploading image
img = st.file_uploader("Plese upload the image here",type=['png','jpg','jpeg'])
if img is not None:
    st.image(img)

#uploading video
img = st.file_uploader("Plese upload the vedio here",type=['mp4'])
if img is not None:
    st.video(img)

#uploading multiple images
img = st.file_uploader("Plese upload the multiple images here",type=['png','jpg','jpeg'],accept_multiple_files=True)
if img is not None:
    for ims in img:
        st.image(img)