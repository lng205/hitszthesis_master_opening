# Simple Makefile for HITSZ Thesis

# Configuration
BUILDDIR = build
MAIN = main
LATEX = xelatex -shell-escape

# File patterns
TEXFILES = $(MAIN).tex front/*.tex body/*.tex back/*.tex
BIBFILES = *.bib
STYLEFILES = *.cls *.sty *.cfg *.ist *.bst

# Cross-platform commands
ifdef SystemRoot
	RM = del /Q /S
	MKDIR = mkdir
	COPY = xcopy /E /I /Y
	OPEN = start
else
	RM = rm -rf
	MKDIR = mkdir -p
	COPY = cp -r
	OPEN = xdg-open
endif

# Default target
all: thesis

# Generate class file from .ins if needed
hitszthesis.cls: hitszthesis.ins hitszthesis.dtx
	@echo "Generating hitszthesis.cls..."
	@latex hitszthesis.ins > /dev/null 2>&1
	@echo "Class file generated successfully"

# Create build directory
$(BUILDDIR):
	@$(MKDIR) $(BUILDDIR)

# Copy source files to build directory
copy-sources: hitszthesis.cls $(BUILDDIR)
	@echo "Copying source files..."
	@$(COPY) $(MAIN).tex $(BUILDDIR)/ 2>/dev/null || cp $(MAIN).tex $(BUILDDIR)/
	@$(COPY) front $(BUILDDIR)/ 2>/dev/null || cp -r front $(BUILDDIR)/ || true
	@$(COPY) body $(BUILDDIR)/ 2>/dev/null || cp -r body $(BUILDDIR)/ || true
	@$(COPY) back $(BUILDDIR)/ 2>/dev/null || cp -r back $(BUILDDIR)/ || true
	@$(COPY) figures $(BUILDDIR)/ 2>/dev/null || cp -r figures $(BUILDDIR)/ || true
	@$(COPY) *.bib $(BUILDDIR)/ 2>/dev/null || cp *.bib $(BUILDDIR)/ || true
	@$(COPY) *.cls $(BUILDDIR)/ 2>/dev/null || cp *.cls $(BUILDDIR)/ || true
	@$(COPY) *.sty $(BUILDDIR)/ 2>/dev/null || cp *.sty $(BUILDDIR)/ || true
	@$(COPY) *.cfg $(BUILDDIR)/ 2>/dev/null || cp *.cfg $(BUILDDIR)/ || true
	@$(COPY) *.ist $(BUILDDIR)/ 2>/dev/null || cp *.ist $(BUILDDIR)/ || true
	@$(COPY) *.bst $(BUILDDIR)/ 2>/dev/null || cp *.bst $(BUILDDIR)/ || true

# Build thesis
thesis: copy-sources
	@echo "Building thesis..."
	@cd $(BUILDDIR) && $(LATEX) $(MAIN).tex
	@cd $(BUILDDIR) && bibtex $(MAIN) || true
	@cd $(BUILDDIR) && $(LATEX) $(MAIN).tex
	@cd $(BUILDDIR) && $(LATEX) $(MAIN).tex
	@echo "Thesis built successfully: $(BUILDDIR)/$(MAIN).pdf"

# Copy PDF to root directory
pdf: thesis
	@$(COPY) $(BUILDDIR)/$(MAIN).pdf . 2>/dev/null || cp $(BUILDDIR)/$(MAIN).pdf .
	@echo "PDF copied to $(MAIN).pdf"

# Count words
wc:
	@texcount $(MAIN).tex -inc -chinese

# Clean build files
clean:
	@echo "Cleaning build directory..."
	@$(RM) $(BUILDDIR) 2>/dev/null || true


# Force rebuild
rebuild: clean thesis

# Help
help:
	@echo "Available targets:"
	@echo "  thesis    - Build the thesis (output in build/ directory)"
	@echo "  pdf       - Build thesis and copy PDF to root directory"
	@echo "  wc        - Count words in the document"
	@echo "  clean     - Remove build directory"
	@echo "  rebuild   - Clean and rebuild everything"
	@echo "  help      - Show this help message"
	@echo ""
	@echo "Note: Class files (.cls, .cfg, .ist) will be auto-generated on first build"

.PHONY: all thesis pdf wc clean rebuild help copy-sources
