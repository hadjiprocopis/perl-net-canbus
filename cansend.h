/* our $VERSION = '0.01'; */

#ifndef _CANSEND_H
#define _CANSEND_H

/* It will send the specified data canframe
   to the specified deviceid.

   It returns 1 on error.
   It returns 0 on success.
*/
int cansend(
	const char *deviceid,
	/*const*/ char *canframe
);

#endif
