namespace cpp test.regression_compat
namespace cpp2 test.regression_compat
namespace d test.regression_compat
namespace java test.regression_compat
namespace java.swift test.regression_compat
namespace php test.regression_compat
namespace python test.regression_compat

enum repeated_values_enum {
  A = 0,
  B = 0,
  C = 1,
  D = 2,
  E = 3
} (thrift.duplicate_values)

struct template_arguments_struct {
  1: i32 T
  2: i32 U
  3: i32 V
  4: i32 Args
  5: i32 UArgs
  6: i32 VArgs
}

struct template_arguments_union {
  1: i32 T
  2: i32 U
  3: i32 V
  4: i32 Args
  5: i32 UArgs
  6: i32 VArgs
}

enum template_arguments_enum {
  T = 0,
  U = 1,
  V = 2,
  Args = 3,
  UArgs = 4,
  VArgs = 5,
}
