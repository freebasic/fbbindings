#pragma once

#include once "crt/long.bi"
#include once "X11/Xfuncproto.bi"
#include once "X11/ICE/ICEconn.bi"

extern "C"

#define _ICEMSG_H_
declare function _IceRead(byval as IceConn, byval as culong, byval as zstring ptr) as long
declare sub _IceReadSkip(byval as IceConn, byval as culong)
declare sub _IceWrite(byval as IceConn, byval as culong, byval as zstring ptr)
declare sub _IceErrorBadMinor(byval as IceConn, byval as long, byval as long, byval as long)
declare sub _IceErrorBadState(byval as IceConn, byval as long, byval as long, byval as long)
declare sub _IceErrorBadLength(byval as IceConn, byval as long, byval as long, byval as long)
declare sub _IceErrorBadValue(byval as IceConn, byval as long, byval as long, byval as long, byval as long, byval as IcePointer)
declare function _IcePoMagicCookie1Proc(byval as IceConn, byval as IcePointer ptr, byval as long, byval as long, byval as long, byval as IcePointer, byval as long ptr, byval as IcePointer ptr, byval as zstring ptr ptr) as IcePoAuthStatus
declare function _IcePaMagicCookie1Proc(byval as IceConn, byval as IcePointer ptr, byval as long, byval as long, byval as IcePointer, byval as long ptr, byval as IcePointer ptr, byval as zstring ptr ptr) as IcePaAuthStatus

#define IceValidIO(_iceConn) _iceConn->io_ok
#define IceGetHeader(_iceConn, _major, _minor, _headerSize, _msgType, _pMsg) '' TODO: if ((_iceConn->outbufptr + _headerSize) > _iceConn->outbufmax) IceFlush (_iceConn); _pMsg = (_msgType *) _iceConn->outbufptr; _pMsg->majorOpcode = _major; _pMsg->minorOpcode = _minor; _pMsg->length = (_headerSize - SIZEOF (iceMsg)) >> 3; _iceConn->outbufptr += _headerSize; _iceConn->send_sequence++
#define IceGetHeaderExtra(_iceConn, _major, _minor, _headerSize, _extra, _msgType, _pMsg, _pData) '' TODO: if ((_iceConn->outbufptr + _headerSize + ((_extra) << 3)) > _iceConn->outbufmax) IceFlush (_iceConn); _pMsg = (_msgType *) _iceConn->outbufptr; if ((_iceConn->outbufptr + _headerSize + ((_extra) << 3)) <= _iceConn->outbufmax) _pData = (char *) _pMsg + _headerSize; else _pData = NULL; _pMsg->majorOpcode = _major; _pMsg->minorOpcode = _minor; _pMsg->length = ((_headerSize - SIZEOF (iceMsg)) >> 3) + (_extra); _iceConn->outbufptr += (_headerSize + ((_extra) << 3)); _iceConn->send_sequence++
#macro IceSimpleMessage(_iceConn, _major, _minor)
	scope
		dim _pMsg as iceMsg ptr
		IceGetHeader(_iceConn, _major, _minor, XSIZEOF(iceMsg), iceMsg, _pMsg)
	end scope
#endmacro
#macro IceErrorHeader(_iceConn, _offendingMajorOpcode, _offendingMinorOpcode, _offendingSequenceNum, _severity, _errorClass, _dataLength)
	scope
		dim _pMsg as iceErrorMsg ptr
		IceGetHeader(_iceConn, _offendingMajorOpcode, ICE_Error, XSIZEOF(iceErrorMsg), iceErrorMsg, _pMsg)
		'' TODO: _pMsg->length += (_dataLength);
		'' TODO: _pMsg->offendingMinorOpcode = (CARD8) _offendingMinorOpcode;
		'' TODO: _pMsg->severity = (CARD8) _severity;
		'' TODO: _pMsg->offendingSequenceNum = (CARD32) _offendingSequenceNum;
		'' TODO: _pMsg->errorClass = (CARD16) _errorClass;
	end scope
#endmacro
#define IceWriteData(_iceConn, _bytes, _data) '' TODO: { if ((_iceConn->outbufptr + (_bytes)) > _iceConn->outbufmax) { IceFlush (_iceConn); _IceWrite (_iceConn, (unsigned long) (_bytes), _data); } else { memcpy (_iceConn->outbufptr, _data, _bytes); _iceConn->outbufptr += (_bytes); }}
#define IceWriteData16(_iceConn, _bytes, _data) IceWriteData(_iceConn, _bytes, cptr(zstring ptr, _data))
#define IceWriteData32(_iceConn, _bytes, _data) IceWriteData(_iceConn, _bytes, cptr(zstring ptr, _data))
#macro IceSendData(_iceConn, _bytes, _data)
	scope
		'' TODO: if (_iceConn->outbufptr > _iceConn->outbuf) IceFlush (_iceConn);
		_IceWrite(_iceConn, cast(culong, (_bytes)), _data)
	end scope
#endmacro
#define IceWritePad(_iceConn, _bytes) '' TODO: { if ((_iceConn->outbufptr + (_bytes)) > _iceConn->outbufmax) { char _dummy[7] = { 0 }; IceFlush (_iceConn); _IceWrite (_iceConn, (unsigned long) (_bytes), _dummy); } else { _iceConn->outbufptr += (_bytes); }}
#macro IceReadCompleteMessage(_iceConn, _headerSize, _msgType, _pMsg, _pData)
	scope
		dim _bytes as culong
		IceReadMessageHeader(_iceConn, _headerSize, _msgType, _pMsg)
		'' TODO: _bytes = (_pMsg->length << 3) - (_headerSize - SIZEOF (iceMsg));
		'' TODO: if ((_iceConn->inbufmax - _iceConn->inbufptr) >= _bytes) { _IceRead (_iceConn, _bytes, _iceConn->inbufptr); _pData = _iceConn->inbufptr; _iceConn->inbufptr += _bytes; }
		'' TODO: else { _pData = malloc (_bytes); if (_pData) _IceRead (_iceConn, _bytes, _pData); else _IceReadSkip (_iceConn, _bytes); }
	end scope
#endmacro
#define IceDisposeCompleteMessage(_iceConn, _pData) '' TODO: if ((char *) _pData < _iceConn->inbuf || (char *) _pData >= _iceConn->inbufmax) free (_pData);
#define IceReadSimpleMessage(_iceConn, _msgType, _pMsg) '' TODO: _pMsg = (_msgType *) (_iceConn->inbuf);
#macro IceReadMessageHeader(_iceConn, _headerSize, _msgType, _pMsg)
	scope
		_IceRead(_iceConn, cast(culong, _headerSize - XSIZEOF(iceMsg)), _iceConn->inbufptr)
		'' TODO: _pMsg = (_msgType *) (_iceConn->inbuf);
		'' TODO: _iceConn->inbufptr += (_headerSize - SIZEOF (iceMsg));
	end scope
#endmacro
#define IceReadData(_iceConn, _bytes, _pData) '' TODO: _IceRead (_iceConn, (unsigned long) (_bytes), (char *) _pData);
#macro IceReadData16(_iceConn, _swap, _bytes, _pData)
	scope
		_IceRead(_iceConn, cast(culong, (_bytes)), cptr(zstring ptr, _pData))
	end scope
#endmacro
#macro IceReadData32(_iceConn, _swap, _bytes, _pData)
	scope
		_IceRead(_iceConn, cast(culong, (_bytes)), cptr(zstring ptr, _pData))
	end scope
#endmacro
#macro IceReadPad(_iceConn, _bytes)
	scope
		dim _dummy as zstring * 7
		_IceRead(_iceConn, cast(culong, (_bytes)), _dummy)
	end scope
#endmacro

end extern
