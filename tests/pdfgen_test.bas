#include once "pdfgen.bi"
#include once "crt/stdint.bi"
#include once "crt/stdio.bi"
Dim As pdf_info info
info.creator = "My software"
info.producer = "My software"
info.title = "My document"
info.author = "My name"
info.subject = "My subject"
info.date = "Today"
 Dim pdf As pdf_doc Ptr = pdf_create(csng((210.0f * 72.0f) / 25.4f), csng((297.0f * 72.0f) / 25.4f), @info)
pdf_set_font(pdf, "Times-Roman")
pdf_append_page(pdf)
pdf_add_text(pdf, NULL, "This is text", 12, 50, 20, culng((((0 and &hff) shl 16) or ((0 and &hff) shl 8)) or (0 and &hff)))
pdf_add_line(pdf, NULL, 50, 24, 150, 24, 3, culng((((0 and &hff) shl 16) or ((0 and &hff) shl 8)) or (0 and &hff)))
pdf_save(pdf, "output.pdf")
pdf_destroy(pdf)
Print "done,pls check the left bottom of the Output.pdf"
 Sleep