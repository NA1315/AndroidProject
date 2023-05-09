import pandas as pd

df1=pd.read_excel('appversion.xlsx', sheet_name="Sheet1")
df2=pd.read_excel('reference.xlsx', sheet_name="APK")

df1.equals(df2)
comparison_values = df1.values == df2.values


for i, col in enumerate(comparison_values):
    b = all(col)
    if not b:
        print("changed: ", b)

df1["Status"] = "Not Changed"

for i, col in enumerate(comparison_values):
    b = all(col)
    if not b:
        df1["Status"].iloc[i] = "Changed"


df1.to_excel("result_B.xlsx")