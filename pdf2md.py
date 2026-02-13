import pymupdf.layout
import pymupdf4llm
import sys
md_text = pymupdf4llm.to_markdown(sys.argv[1])

import pathlib
pathlib.Path("pdf2md.md").write_bytes(md_text.encode())
