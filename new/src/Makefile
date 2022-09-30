# ----------------------------------------------------------------
# This Makefile is part of RTL.
#
# (c) Copyright 2022 Jens Kallup - paule32
# only for non-profit usage !!!
#
# You should use the script: build.sh to use this Makefile right !
# I have assume GNU make.exe; but other Makefile tools can differ.
# ----------------------------------------------------------------
.all:   build
.PHONY: clean boot check build

# --------------------------------------------------
# this section is user/developer speciefic.
# you have to set on your own ...
# --------------------------------------------------
FPC_DIR   = C:\Lazarus\fpc\3.2.2\bin\x86_64-win64
DEV_QTDIR = E:\Qt64-5.0.1
DEV_PWD   = $(shell pwd)
DEV_DRV   = E

# ---------------------------------------------------------
# V marks the letter's that you have to change if you work
# under Windows 10.
# Note: the : after the drive definiton !
# ---------------------------------------------------------
#                      V            V
DEV_DRIVE = 's/^\/$(DEV_DRV)\//$(DEV_DRV)\:\//gi'

DEV_TERM  = $(shell echo $$MSYSTEM)
DEV_OS    = $(shell echo $$OS)
DEV_LANG  = $(shell powershell get-uiculture | grep de | awk '{print $$2}')

DEV_CCVER = $(shell $(GCC) -dumpversion | cut -f1 -d.)
DEV_PPVER = $(shell $(GXX) -dumpversion | cut -f1 -d.)

# ---------------------------------------------------------
# compiler section:
# ---------------------------------------------------------
GCC       = gcc              # i used MinGW-64 10.0.0
GXX       = g++              # ...
FPC       = $(FPC_DIR)\fpc   # tests with 3.2.2
GDB       = gdb              # command line

# ---------------------------------------------------------
# determine the gcc version level. the smallest supported
# version is 7 ...
# ---------------------------------------------------------
GCC_FOUND = 0
ifeq ($(shell [[ $(DEV_CCVER) == 10 && $(DEV_PPVER) == 10 ]] && echo true),true)
  GCC_FOUND = 1
  GXX_FOUND = 1
endif
ifeq ($(shell [[ $(DEV_CCVER) ==  9 && $(DEV_PPVER) ==  9 ]] && echo true),true)
  GCC_FOUND = 1
  GXX_FOUND = 1
endif
ifeq ($(shell [[ $(DEV_CCVER) ==  8 && $(DEV_PPVER) ==  8 ]] && echo true),true)
  GCC_FOUND = 1
  GXX_FOUND = 1
endif
ifeq ($(shell [[ $(DEV_CCVER) ==  7 && $(DEV_PPVER) ==  7 ]] && echo true),true)
  GCC_FOUND = 1
  GXX_FOUND = 1
endif

# ---------------------------------------------------------
# define the upper and lower cased characters
# ---------------------------------------------------------
luc_JOIN ::= ,

lc_CHARS ::= a b c d e f g h i j k l m n o p q r s t u v w x y z
uc_CHARS ::= A B C D E F G H I J K L M N O P Q R S T U V W X Y Z

lc_TABLE ::= $(join $(uc_CHARS),$(addprefix $(luc_JOIN),$(lc_CHARS)))
uc_TABLE ::= $(join $(lc_CHARS),$(addprefix $(luc_JOIN),$(uc_CHARS)))

luc_internal = $(if $1,$$(subst $(firstword $1),$(call luc_internal,$(wordlist 2,$(words $1),$1),$2)),$2)

lowerCase = $(eval lc_RESULT ::= $(call luc_internal,$(lc_TABLE),$1))$(lc_RESULT)
upperCase = $(eval uc_RESULT ::= $(call luc_internal,$(uc_TABLE),$1))$(uc_RESULT)

# ---------------------------------------------------------
# the command's below should be come with the MinGW Utils.
# ---------------------------------------------------------
RM        = rm -rf
MKDIR     = mkdir -p
COPY      = cp
ECHO      = echo
SED       = sed
STRIP     = strip

# ----------------------------------------
# gnu c/c++ speciefied compiler flags.
# default: win64
# ----------------------------------------
CFLAGS    = -m64 -std=c++2a -I. -O2 -Wfatal-errors \
            -shared -fPIC -DWINDOWS
FPC_FLAGS = -l- -Ur -WN -O2
GDB_FLAGS = -ggdb

# -----------------------
# temporary settings ...
# -----------------------
ASM_DIR  = $(DEV_PWD)/.asm
OBJ_DIR  = $(DEV_PWD)/.obj

# ---------------------------
# the source directories ...
# ---------------------------
SRC_DIR  = $(DEV_PWD)/src
ASM_SRC  = $(SRC_DIR)_asm
PAS_SRC  = $(SRC_DIR)_pas
CPP_SRC  = $(SRC_DIR)_cpp
# ---- #
PAS_OUT  = $(OBJ_DIR)/src_pas
CPP_OUT  = $(OBJ_DIR)/src_cpp

# ----------------------------------------
# include path's ...
# ----------------------------------------
INCLUDE  = $(CPP_SRC)/inc

CINCLUDE =                 \
    -I$(CPP_SRC)/inc       \
	-I$(INCLUDE)           \
    -I$(DEV_QTDIR)/include \
    -I$(DEV_QTDIR)/include/QtCore
    
CLIB_FLAGS = -L$(DEV_QTDIR)/lib

FPC_FLAGS += -Fusrc_pas\qt5 -FUdll_x64\units

# -------------------------------------
# the entiere source files ...
# -------------------------------------
CPP_SRC_FILES =                  \
	$(CPP_SRC)/qt5/QObject.cc    \
    $(CPP_SRC)/dll_main.cc       \
    pas_test/modtest.cc              \
    \
    $(CPP_SRC)/vcl/TObject.cc    \
    $(CPP_SRC)/vcl/TException.cc \
    $(CPP_SRC)/vcl/TClass.cc     \
    \
    $(CPP_SRC)/vcl/IUnknown.cc   \
    $(CPP_SRC)/vcl/ISomething.cc

#
PAS_SRC_FILES = \
	$(PAS_SRC)/qt5/QObject.pas

# -------------------------------------
# the corresponding .o bject files ...
# -------------------------------------
CPP_OBJ_FILES =                  \
	$(CPP_OUT)/qt5/QObject.o     \
    $(CPP_OUT)/dll_main.o        \
    $(CPP_OUT)/modtest.o    \
    \
    $(CPP_OUT)/vcl/TObject.o     \
    $(CPP_OUT)/vcl/TException.o  \
    $(CPP_OUT)/vcl/TClass.o      \
    \
    $(CPP_OUT)/vcl/IUnknown.o    \
    $(CPP_OUT)/vcl/ISomething.o

#
PAS_OBJ_FILES = \
    $(PAS_OUT)/qt5/QObject.o

SRC_FILES = $(CPP_SRC_FILES) $(PAS_SRC_FILES)
OBJ_FILES = $(CPP_OBJ_FILES) $(PAS_OBJ_FILES)

# ------------------------------------------
# now, hand sorted .dll .o bject files ...
# ------------------------------------------
QT5_DLLOF = $(CPP_OBJ_FILES)

# ---------------------------------------------------------------------
# i hard hand-code the .def file, because the automatic
# procedure get many extra informations, that are not needed;
# so the size of the .dll file is smaller.
# ----------------------------------------------------------------------
define qt5dll_def =
	@$(ECHO) EXPORTS                        > $(1)
endef

# --------------------------------------------------------
# that you can use the compiled fpc / c / c++ unit codes,
# we have to create an .a rchive file, which contains the
# "import" symbols to call the functions in the .dll file
# --------------------------------------------------------
define dll_a =
	@dlltool \
		--def        $(subst /,\,$(shell echo $(2) | sed $(DEV_DRIVE))) \
		--dllname    $(subst /,\,$(subst .def,.dll,$(shell echo $(2) | sed $(DEV_DRIVE)))) \
		--output-lib $(subst /,\,$(shell echo $(1) | sed $(DEV_DRIVE)))
	@$(STRIP)        $(subst /,\,$(subst .def,.dll,$(shell echo $(2) | sed $(DEV_DRIVE))))
endef

# ------------------------------------------------------
# i had think, to reduce the size of this Makefile, and
# to have a better maintain, i create this macro that
# assemble the given .dll in parameter 1 with the given
# .o bject's in parameter 2.
# ------------------------------------------------------
define make_dll    =
	@$(ECHO) -e $(MAKE_CREATE1) DLL $(1)
	$(GXX) $(CFLAGS) -shared -fPIC -o $1 $(2) \
    -L $(DEV_QTDIR)\lib \
    -lQt5Core    \
    -lQt5Widgets \
    -lQt5UiTools
endef

define pas_compile =
	$(FPC) $(FPC_FLAGS) -o$(1) $(2)
endef

define cc_compile  =
	$(GXX) $(CFLAGS) $(CINCLUDE) -shared -fPIC -o $(1) -c $(2)
endef

# ------------------------------------------------------
# this section is Windows 10 Pro 64-Bit specialized ...
# $(OBJ_FILES) $(DLL_FILE).def
# ------------------------------------------------------
REDI_NULL = > nul:
DLL_DIR   = $(DEV_PWD)/dll_x64

DLL_FILES = \
	$(DLL_DIR)/qt5_fpc.dll

DEF_FILES = \
	$(DLL_DIR)/qt5_fpc.def

ALD_FILES = \
	$(DLL_DIR)/libqt5_fpc.a

# ---------------------------------------------
# template: create .dll from .o bject files.
# $(OBJ_FILES)
# ---------------------------------------------
$(DLL_FILES):
$(DLL_DIR)/qt5_fpc.dll: $(QT5_DLLOF) ; $(call make_dll,$@,$^)

# ---------------------------------------------
# template: create .def inition file for linker
# ---------------------------------------------
$(DEF_FILES):
$(DLL_DIR)/qt5_fpc.def: $(DLL_DIR)/qt5_fpc.dll ; $(call qt5dll_def,$@)

# ---------------------------------------------
# template: create .a rchive file for linker.
# ---------------------------------------------
$(ALD_FILES):
$(DLL_DIR)/libqt5_fpc.a: $(DLL_DIR)/qt5_fpc.def ; $(call dll_a,$@,$<)

# ---------------------------------------------
# template: compile .pas to .o object file.
# ---------------------------------------------
$(PAS_OUT)/qt5/%.o: $(PAS_SRC)/qt5/%.pas ; $(call pas_compile,$@,$<)
$(PAS_SRC)/qt5/%.pas:      ; @echo "compile: $@"

# ---------------------------------------------
# template: compile .cc to .o object file.
# ---------------------------------------------
$(CPP_OUT)/qt5/%.o: $(CPP_SRC)/qt5/%.cc  ; $(call cc_compile,$@,$<)
$(CPP_OUT)/vcl/%.o: $(CPP_SRC)/vcl/%.cc  ; $(call cc_compile,$@,$<)
$(CPP_OUT)/%.o:     $(CPP_SRC)/%.cc      ; $(call cc_compile,$@,$<)

$(CPP_OUT)/%.o:     pas_test/%.cc        ; $(call cc_compile,$@,$<)
pas_test/%.cc:                           ; @echo "compile: $@"

$(CPP_SRC)/qt5/%.cc:       ; @echo "compile: $@"
$(CPP_SRC)/vcl/%.cc:       ; @echo "compile: $@"
$(CPP_SRC)/%.cc:           ; @echo "compile: $@"

# ---------------------------------------------
# Makefile: default entry point ...
# ---------------------------------------------
compile: compile_notice                     \
	$(SRC_FILES) $(OBJ_FILES)               \
	$(DLL_FILES) $(DEF_FILES) $(ALD_FILES)

compile_notice:
	@$(call Write,$(MAKE_COMNOTE))

build: check clean boot compile
	@$(RM) tmp.0
	@$(call Write,$(MAKE_DONE))

# ---------------------------------------------
# check, if we on Windows with MinGW-64 ...
# ---------------------------------------------
check:
	@$(call Write,$(MAKE_WELCOME))
	@$(call Write,$(MAKE_CHKSYS))
ifndef DEV_TERM
	@$(call WriteError,"$(MAKE_WRONGP)$(MAKE_NL)$(MAKE_ABORT))
else
    # ---------------------------------------------------------
    # here, we are under Windows 10 ... ?
    # ---------------------------------------------------------
    ifeq ("$(findstring Windows,$(DEV_OS))","Windows")
        ifeq ("$(DEV_TERM)","MINGW632")
			@$(call WriteError,"32 bit version" $(MAKE_NOSUPP))
        endif
        ifeq ("$(DEV_TERM)","MINGW64")
			@$(call WriteSuccess,\
			$(call Write,$(call moveback,$(MAKE_SUCCOK))))
        else
			@$(call WriteError,$(MAKE_NOSFRM))
        endif
        # ---------------------------------------------------------
        # in earlier step, we check, if the gcc version not under
        # the level 7. But if so, warn the developer of this issue
        # for both compilers: gcc (.c), and g++ (.cc) compiler.
        # ---------------------------------------------------------
        ifeq ($(GCC_FOUND),0)
			@$(call WriteError,$(MAKE_NOCC))
        endif
        ifeq ($(GXX_FOUND),0)
			@$(call WriteError,$(MAKE_NOPP))
        endif
    endif
endif

# --------------------------------------------------
# this section, create/remove temporary folder's ...
# --------------------------------------------------
DIR_FOLDERS = \
    $(OBJ_DIR)/$(CPP_SRC) \
    $(OBJ_DIR)/$(PAS_SRC) \
    $(OBJ_DIR)

PRE_FOLDERS = fpc qt5 vcl

# -------------------------------------------
# this target, create all temporary files ...
# -------------------------------------------
boot:
	@$(call Write,$(MAKE_CREATE))
	@$(foreach folder,$(PRE_FOLDERS),$(MKDIR) $(CPP_OUT)/$(folder) && ) true
	@$(foreach folder,$(PRE_FOLDERS),$(MKDIR) $(PAS_OUT)/$(folder) && ) true
	@$(MKDIR) -p $(DLL_DIR)/units

# -------------------------------------------
# this target, remove all temporary files ...
# -------------------------------------------
clean:
	@$(call Write,$(MAKE_REMOVE))
	@$(foreach folder,$(PRE_FOLDERS),$(RM) $(CPP_OUT)/$(folder) && ) true
	@$(foreach folder,$(PRE_FOLDERS),$(RM) $(PAS_OUT)/$(folder) && ) true
	@$(RM) -rf $(DLL_DIR)

# --------------------------------------------------
# this section describe the locales strings for the
# Makefile session. Currently support is for:
# ENGLISH, and GERMAN
# --------------------------------------------------
ifeq ("$(DEV_LANG)","en-US")
  include Makefile.xterm
  include Makefile.ENG
endif
ifeq ("$(DEV_LANG)","de-DE")
  include Makefile.xterm
  include Makefile.DEU
endif

MAKE_NL     = "\\n"
MAKE_COMMA  = ","
MAKE_OKAY   = "ok"$(MAKE_COMMA)

# --------------------------------------------------
# this section provide internal use tool functions:
# --------------------------------------------------

# --------------------------------------------------
# convert german umlauts from ANSI to UNICODE, and
# write the string $(1) on terminal device ...
# --------------------------------------------------
define Write
    echo -e $(subst ü,$(CHAR_MINUE),\
    $(subst ö,$(CHAR_MINOE),\
    $(subst ä,$(CHAR_MINAE),\
    $(subst Ü,$(CHAR_BIGUE),\
    $(subst Ö,$(CHAR_BIGOE),\
    $(subst Ä,$(CHAR_BIGAE),\
    $(subst ß,$(CHAR_MINSZ),\
    $(1))))))))
endef

# --------------------------------------------------
# moveback erase the current line, and move cursor
# to the start column of the terninal device ...
# --------------------------------------------------
define moveback
	"\\r"$(1)
endef

# --------------------------------------------------
# WriteError is used to print out error message on
# the current terminal device ...
# --------------------------------------------------
define WriteSuccess
    $(call Write,$(call moveback,$(color_error)$(MAKE_SUCCESS)":"\
    $(color_normal)$(MAKE_NL)$(color_info)$(1)$(color_normal)))
    true
endef

# --------------------------------------------------
# WriteError is used to print out error message on
# the current terminal device ...
# --------------------------------------------------
define WriteError
    $(call Write,$(call moveback,$(color_error)$(MAKE_ERROR)":"\
    $(color_normal)$(MAKE_NL)$(color_info)$(1)$(color_normal)))
    false
endef
