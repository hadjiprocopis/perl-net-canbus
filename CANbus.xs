#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include <stdio.h>
#include <stdlib.h>

/* our $VERSION = '0.01'; */

/* helper func to check if SV contains undef */
int _SV_contains_undef(SV *ansv){ SvGETMAGIC(ansv); return(!SvOK(ansv)); }

#include "cansend.h"

MODULE = Net::CANbus		PACKAGE = Net::CANbus

PROTOTYPES: ENABLE

int
CANsend_xs(deviceid_SV, canframe_SV)
	SV *deviceid_SV;
	SV *canframe_SV;

    PROTOTYPE: @

    PREINIT:
	char *deviceid;
	char *canframe;
	STRLEN deviceid_len;
	STRLEN canframe_len;
    INIT:

    CODE:
	/* this is a bit of a hocus-pocus ... */
	deviceid = SvUTF8(deviceid_SV)
		? SvPVutf8(deviceid_SV, deviceid_len) : SvPVbyte(deviceid_SV, deviceid_len)
	;
	canframe = SvUTF8(canframe_SV)
		? SvPVutf8(canframe_SV, canframe_len) : SvPVbyte(canframe_SV, canframe_len)
	;

	fprintf(stdout, "CANsend_xs() : got these input parameters:"
"\n  deviceid(length %zu)='%s'"
"\n  canframe(length: %zu)='%s'"
"\nCANsend_xs() : end of input parameters.\n",
		deviceid_len, deviceid,
		canframe_len, canframe
	);

	int rc = cansend(deviceid, canframe);
	if( rc != 0 ){
		fprintf(stderr, "cansend() : call to CANsend_xs() has failed with code %d.\n", rc);
	} else {
		fprintf(stderr, "cansend() : success, data sent.\n");
	}
	RETVAL = rc;

	OUTPUT:
		RETVAL
