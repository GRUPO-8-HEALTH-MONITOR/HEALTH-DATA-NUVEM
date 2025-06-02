import zipfile

with zipfile.ZipFile("lambda.zip", "w") as zipf:
    zipf.write("python_function.py", arcname="python_function.py")