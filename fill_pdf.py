#!/usr/bin/env python3
import sys
from pathlib import Path
from typst_fillable import make_fillable

if __name__ == "__main__":
    if len(sys.argv) != 4:
        print("Usage: python fill_pdf.py <template.typ> <input.pdf> <output.pdf>")
        sys.exit(1)
    template, input_pdf, output = sys.argv[1], sys.argv[2], sys.argv[3]
    print(f"Converting {input_pdf} to fillable PDF: {output}")
    pdf_bytes = Path(input_pdf).read_bytes()
    result = make_fillable(template=template, pdf_bytes=pdf_bytes)
    Path(output).write_bytes(result)
    print("Done.")
