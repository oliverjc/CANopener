#
# "main" pseudo-component makefile.
#
# (Uses default behaviour of compiling all source files in directory, adding 'include' to include path.)

#
# "main" pseudo-component makefile.
#
# (Uses default behaviour of compiling all source files in directory, adding 'include' to include path.)

ARDUINO_ULIBRARIES_LIST := $(patsubst $(COMPONENT_PATH)/libraries/%,%,$(wildcard $(COMPONENT_PATH)/libraries/*))
ARDUINO_SINGLE_ULIBRARY_FILES = $(patsubst $(COMPONENT_PATH)/%,%,$(sort $(dir $(wildcard $(COMPONENT_PATH)/libraries/$(MODULE)/*)) $(dir $(wildcard $(COMPONENT_PATH)/libraries/$(MODULE)/src/*/)) $(dir $(wildcard $(COMPONENT_PATH)/libraries/$(MODULE)/src/*/*/)) $(dir $(wildcard $(COMPONENT_PATH)/libraries/$(MODULE)/src/*/*/*/)) $(dir $(wildcard $(COMPONENT_PATH)/libraries/$(MODULE)/src/*/*/*/*/))))
ARDUINO_USER_LIBS := $(foreach MODULE,$(ARDUINO_ULIBRARIES_LIST), $(ARDUINO_SINGLE_ULIBRARY_FILES))

# Inlcude the arudino libraries and all the sources and headers from the src & include directories
COMPONENT_ADD_INCLUDEDIRS := $(ARDUINO_USER_LIBS) . include
COMPONENT_SRCDIRS := $(ARDUINO_USER_LIBS) . src

# If you need to use SSL, you need a cert
# COMPONENT_EMBED_TXTFILES :=  ${PROJECT_PATH}/server_certs/ca_cert.pem