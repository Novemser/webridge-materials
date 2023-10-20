/*
 * Copyright (C) 2014, United States Government, as represented by the
 * Administrator of the National Aeronautics and Space Administration.
 * All rights reserved.
 *
 * Symbolic Pathfinder (jpf-symbc) is licensed under the Apache License,
 * Version 2.0 (the "License"); you may not use this file except
 * in compliance with the License. You may obtain a copy of the License at
 *
 *        http://www.apache.org/licenses/LICENSE-2.0.
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*  Copyright (C) 2005 United States Government as represented by the
Administrator of the National Aeronautics and Space Administration
(NASA).  All Rights Reserved.

Copyright (C) 2009 Fujitsu Laboratories of America, Inc.

DISCLAIMER OF WARRANTIES AND LIABILITIES; WAIVER AND INDEMNIFICATION

A. No Warranty: THE SUBJECT SOFTWARE IS PROVIDED "AS IS" WITHOUT ANY
WARRANTY OF ANY KIND, EITHER EXPRESSED, IMPLIED, OR STATUTORY,
INCLUDING, BUT NOT LIMITED TO, ANY WARRANTY THAT THE SUBJECT SOFTWARE
WILL CONFORM TO SPECIFICATIONS, ANY IMPLIED WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, OR FREEDOM FROM
INFRINGEMENT, ANY WARRANTY THAT THE SUBJECT SOFTWARE WILL BE ERROR
FREE, OR ANY WARRANTY THAT DOCUMENTATION, IF PROVIDED, WILL CONFORM TO
THE SUBJECT SOFTWARE. NO SUPPORT IS WARRANTED TO BE PROVIDED AS IT IS PROVIDED "AS-IS".

B. Waiver and Indemnity: RECIPIENT AGREES TO WAIVE ANY AND ALL CLAIMS
AGAINST FUJITSU LABORATORIES OF AMERICA AND ANY OF ITS AFFILIATES, THE
UNITED STATES GOVERNMENT, ITS CONTRACTORS AND SUBCONTRACTORS, AS WELL
AS ANY PRIOR RECIPIENT.  IF RECIPIENT'S USE OF THE SUBJECT SOFTWARE
RESULTS IN ANY LIABILITIES, DEMANDS, DAMAGES, EXPENSES OR LOSSES ARISING
FROM SUCH USE, INCLUDING ANY DAMAGES FROM PRODUCTS BASED ON, OR RESULTING
FROM, RECIPIENT'S USE OF THE SUBJECT SOFTWARE, RECIPIENT SHALL INDEMNIFY
AND HOLD HARMLESS FUJITSU LABORATORTIES OF AMERICA AND ANY OF ITS AFFILIATES,
THE UNITED STATES GOVERNMENT, ITS CONTRACTORS AND SUBCONTRACTORS, AS WELL
AS ANY PRIOR RECIPIENT, TO THE EXTENT PERMITTED BY LAW.  RECIPIENT'S SOLE
REMEDY FOR ANY SUCH MATTER SHALL BE THE IMMEDIATE, UNILATERAL
TERMINATION OF THIS AGREEMENT.

*/

package webridge.wbridge.symbc.string;

import webridge.wbridge.exception.NotImplementedException;

public enum StringComparator {
  EQ(" == ") {
    public StringComparator not() {
      return NE;
    }
  },
  NE(" != ") {
    public StringComparator not() {
      return EQ;
    }
  },
  EQUALS(" equals ") {
    public StringComparator not() {
      return NOTEQUALS;
    }
  },
  NOTEQUALS(" notequals ") {
    public StringComparator not() {
      return EQUALS;
    }
  },
  EQUALSIGNORECASE(" equalsignorecase ") {
    public StringComparator not() {
      return NOTEQUALSIGNORECASE;
    }
  },
  NOTEQUALSIGNORECASE(" notequalsignorecase ") {
    public StringComparator not() {
      return EQUALSIGNORECASE;
    }
  },
  STARTSWITH(" startswith ") {
    public StringComparator not() {
      return NOTSTARTSWITH;
    }
  },
  NOTSTARTSWITH(" notstartswith ") {
    public StringComparator not() {
      return STARTSWITH;
    }
  },
  ENDSWITH(" endswith ") {
    public StringComparator not() {
      return NOTENDSWITH;
    }
  },
  NOTENDSWITH(" notendswith ") {
    public StringComparator not() {
      return ENDSWITH;
    }
  },
  CONTAINS(" contains ") {
    public StringComparator not() {
      return NOTCONTAINS;
    }
  },
  NOTCONTAINS(" notcontains ") {
    public StringComparator not() {
      return CONTAINS;
    }
  },
  ISINTEGER(" isinteger ") {
    public StringComparator not() {
      return NOTINTEGER;
    }
  },
  NOTINTEGER(" notinteger ") {
    public StringComparator not() {
      return ISINTEGER;
    }
  },
  ISFLOAT(" isfloat ") {
    public StringComparator not() {
      return NOTFLOAT;
    }
  },
  NOTFLOAT(" notfloat ") {
    public StringComparator not() {
      return ISFLOAT;
    }
  },
  ISLONG(" islong ") {
    public StringComparator not() {
      return NOTLONG;
    }
  },
  NOTLONG(" notlong ") {
    public StringComparator not() {
      return ISLONG;
    }
  },
  ISDOUBLE(" isdouble ") {
    public StringComparator not() {
      return NOTDOUBLE;
    }
  },
  NOTDOUBLE(" notdouble ") {
    public StringComparator not() {
      return ISDOUBLE;
    }
  },
  ISBOOLEAN(" isboolean ") {
    public StringComparator not() {
      return NOTBOOLEAN;
    }
  },
  NOTBOOLEAN(" notboolean ") {
    public StringComparator not() {
      return ISBOOLEAN;
    }
  },
  EMPTY(" empty ") {
    public StringComparator not() {
      return NOTEMPTY;
    }
  },
  NOTEMPTY(" notempty ") {
    public StringComparator not() {
      return EMPTY;
    }
  },
  MATCHES(" matches ") {
    public StringComparator not() {
      return NOMATCHES;
    }
  },
  NOMATCHES(" nomatches ") {
    public StringComparator not() {
      return MATCHES;
    }
  },
  REGIONMATCHES(" regionmatches ") {
    public StringComparator not() {
      return NOREGIONMATCHES;
    }
  },
  NOREGIONMATCHES(" noregionmatches ") {
    public StringComparator not() {
      return REGIONMATCHES;
    }
  },
  ISNULL(" isnull ") {
    public StringComparator not() {
      return ISNOTNULL;
    }
  },
  ISNOTNULL(" isnotnull ") {
    public StringComparator not() {
      return ISNULL;
    }
  };

  private final String str;

  StringComparator(String str) {
    this.str = str;
  }

  public abstract StringComparator not();

  @Override
  public String toString() {
    return str;
  }

  public boolean evaluate(String left, String right) {
    switch (this) {
      case EQ:
        return left.equals(right);
      case NE:
        return !left.equals(right);
      case EQUALS:
        return left.equals(right);
      case NOTEQUALS:
        return !left.equals(right);
      case EQUALSIGNORECASE:
        return left.equalsIgnoreCase(right);
      case NOTEQUALSIGNORECASE:
        return !left.equalsIgnoreCase(right);
      case STARTSWITH:
        return left.startsWith(right);
      case NOTSTARTSWITH:
        return !left.startsWith(right);
      case ENDSWITH:
        return left.endsWith(right);
      case NOTENDSWITH:
        return !left.endsWith(right);
      case CONTAINS:
        return left.contains(right);
      case NOTCONTAINS:
        return !left.contains(right);
      case ISINTEGER:
      case NOTINTEGER:
      case ISFLOAT:
      case NOTFLOAT:
      case ISLONG:
      case NOTLONG:
      case ISDOUBLE:
      case NOTDOUBLE:
      case ISBOOLEAN:
      case NOTBOOLEAN:
        throw new NotImplementedException();
      case EMPTY:
        return left.isEmpty();
      case NOTEMPTY:
        return !left.isEmpty();
      case MATCHES:
        return left.matches(right);
      case NOMATCHES:
        return !left.matches(right);
      case REGIONMATCHES:
      case NOREGIONMATCHES:
        throw new NotImplementedException();
      case ISNULL:
        return left == null;
      case ISNOTNULL:
        return left != null;
      default:
        return false;
    }
  }
}
