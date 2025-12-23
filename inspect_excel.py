
import pandas as pd
import os

file_path = r'd:/Code/app_code/ai_projects/projects/WatchMaster_AutoGen_v2/data/南京顺序-维修师介绍.xlsx-11.21.xlsx'

try:
    df = pd.read_excel(file_path, header=None) # Read without header to see raw data
    print("All non-null counts:")
    print(df.count())
    
    print("Check Column 1 (Name?):")
    print(df.iloc[:, 1].head(10))
except Exception as e:
    print(f"Error reading excel: {e}")
