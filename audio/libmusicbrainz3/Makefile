# $FreeBSD$

PORTNAME=	libmusicbrainz
PORTVERSION=	3.0.3
PORTREVISION=	5
CATEGORIES=	audio
MASTER_SITES=	ftp://ftp.musicbrainz.org/pub/musicbrainz/ \
		http://ftp.osuosl.org/pub/musicbrainz/
PKGNAMESUFFIX=	3

MAINTAINER=	jhale@FreeBSD.org
COMMENT=	MusicBrainz client library for audio metadata lookup

LICENSE=	LGPL21

DEPRECATED=	Web Service 1.0 support ending 2018-08-01
EXPIRATION_DATE=	2018-08-01

LIB_DEPENDS=	libdiscid.so:audio/libdiscid \
		libneon.so:www/neon

USES=		cmake pathfix
USE_LDCONFIG=	yes

post-patch:
	${REINPLACE_CMD} -e '/CppUnit/d' ${WRKSRC}/CMakeLists.txt
	${REINPLACE_CMD} -e 's|/usr/local|${LOCALBASE}|g' \
		 ${WRKSRC}/cmake/modules/*.cmake

.include <bsd.port.mk>
