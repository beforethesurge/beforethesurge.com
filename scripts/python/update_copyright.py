from datetime import datetime
from pathlib import Path

date_year = datetime.now().year
site_folder = Path("site")

for html_file in site_folder.rglob("*.html"):
    text = html_file.read_text()
    if "{year}" in text:
        text = text.replace("{year}", str(date_year))
        html_file.write_text(text)
