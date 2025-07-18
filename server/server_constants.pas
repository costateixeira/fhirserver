unit server_constants;

{
Copyright (c) 2011+, HL7 and Health Intersections Pty Ltd (http://www.healthintersections.com.au)
All rights reserved.

Redistribution and use in source and binary forms, with or without modification,
are permitted provided that the following conditions are met:

 * Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.
 * Neither the name of HL7 nor the names of its contributors may be used to
   endorse or promote products derived from this software without specific
   prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 'AS IS' AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
POSSIBILITY OF SUCH DAMAGE.
}

{$i fhir.inc}

interface

const
  TX_TESTS_VERSION = '1.7.8';

  {$i version.inc}
  SERVER_FULL_VERSION = FHIR_CODE_FULL_VERSION;
  SERVER_RELEASE_DATE = FHIR_CODE_RELEASE_DATETIME;

  INDEX_DIGITS = 20;
  INDEX_DECIMALS = 30;

  CURRENT_FHIR_STORAGE_VERSION = 2;
  CONFIG_DEFAULT_RIGHTS = 10;
  CONFIG_DATABASE_VERSION = 5;

  DEFAULT_DWELL_TIME_MIN = 30;
  DEFAULT_DWELL_TIME = DEFAULT_DWELL_TIME_MIN / (24*60) {min};
  {$IFDEF LINUX}
  SERVER_OS = 'LINUX';
  {$ENDIF}
  {$IFDEF OSX}
  SERVER_OS = 'OSX';
  {$ENDIF}
  {$IFDEF WINDOWS}
  SERVER_OS = 'WINDOWS';
  {$ENDIF}

implementation

end.

