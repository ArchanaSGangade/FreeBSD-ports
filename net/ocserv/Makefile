# Created by: Carlos J Puga Medina <cpm@fbsd.es>
# $FreeBSD$

PORTNAME=	ocserv
PORTVERSION=	0.11.11
CATEGORIES=	net security
MASTER_SITES=	ftp://ftp.infradead.org/pub/ocserv/ \
		LOCAL/cpm

MAINTAINER=	cpm@FreeBSD.org
COMMENT=	Server implementing the AnyConnect SSL VPN protocol

LICENSE=	GPLv2+
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	autogen:devel/autogen \
		bash:shells/bash \
		gsed:textproc/gsed
LIB_DEPENDS=	liblz4.so:archivers/liblz4 \
		libiconv.so:converters/libiconv \
		libev.so:devel/libev \
		libtalloc.so:devel/talloc \
		libprotobuf-c.so:devel/protobuf-c \
		libgnutls.so:security/gnutls \
		libtasn1.so:security/libtasn1 \
		libnettle.so:security/nettle \
		liboath.so:security/oath-toolkit

USES=		autoreconf cpe gmake gperf libtool localbase ncurses \
		pathfix pkgconfig readline tar:xz
CPE_VENDOR=	infradead
GNU_CONFIGURE=	yes

CONFIGURE_ARGS=	--disable-nls \
		--enable-local-libopts \
		--without-http-parser \
		--without-pcl-lib

USERS=		_ocserv
GROUPS=		_ocserv

USE_RC_SUBR=	ocserv

PLIST_SUB=	USERS="${USERS}" GROUPS="${GROUPS}"

OPTIONS_DEFINE=		DOCS EXAMPLES GSSAPI RADIUS

PORTDOCS=	AUTHORS ChangeLog NEWS README TODO
PORTEXAMPLES=	profile.xml sample.config sample.passwd

GSSAPI_USES=		gssapi:mit
GSSAPI_LIB_DEPENDS=	libkrb5support.so:security/krb5
GSSAPI_CONFIGURE_OFF=	--without-gssapi

RADIUS_LIB_DEPENDS=	libradcli.so:net/radcli
RADIUS_CONFIGURE_OFF=	--without-radius

post-patch:
	@${RM} ${WRKSRC}/doc/*.8

post-install:
	@${MKDIR} ${STAGEDIR}${PREFIX}/etc/ocserv
	@${MKDIR} ${STAGEDIR}/var/run/ocserv
	${INSTALL_DATA} ${FILESDIR}/ocserv.conf ${STAGEDIR}${PREFIX}/etc/ocserv/conf.sample

post-install-DOCS-on:
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${PORTDOCS} ${STAGEDIR}${DOCSDIR}

post-install-EXAMPLES-on:
	@${MKDIR} ${STAGEDIR}${EXAMPLESDIR}
	cd ${WRKSRC}/doc && ${INSTALL_DATA} ${PORTEXAMPLES} ${STAGEDIR}${EXAMPLESDIR}

.include <bsd.port.mk>
