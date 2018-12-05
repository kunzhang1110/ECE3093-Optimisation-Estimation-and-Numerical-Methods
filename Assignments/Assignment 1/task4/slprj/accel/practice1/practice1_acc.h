/*
 * practice1_acc.h
 *
 * Real-Time Workshop code generation for Simulink model "practice1_acc.mdl".
 *
 * Model version              : 1.5
 * Real-Time Workshop version : 7.5  (R2010a)  25-Jan-2010
 * C source code generated on : Wed Apr 10 17:09:59 2013
 *
 * Target selection: accel.tlc
 * Note: GRT includes extra infrastructure and instrumentation for prototyping
 * Embedded hardware selection: 32-bit Generic
 * Emulation hardware selection:
 *    Differs from embedded hardware (MATLAB Host)
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */
#ifndef RTW_HEADER_practice1_acc_h_
#define RTW_HEADER_practice1_acc_h_
#ifndef practice1_acc_COMMON_INCLUDES_
# define practice1_acc_COMMON_INCLUDES_
#include <stdlib.h>
#include <stddef.h>
#define S_FUNCTION_NAME                simulink_only_sfcn
#define S_FUNCTION_LEVEL               2
#define RTW_GENERATED_S_FUNCTION
#include "rtwtypes.h"
#include "simstruc.h"
#include "fixedpoint.h"
#include "mwmathutil.h"
#endif                                 /* practice1_acc_COMMON_INCLUDES_ */

#include "practice1_acc_types.h"

/* Block signals (auto storage) */
typedef struct {
  real_T B_0_13_0;                     /* '<S3>/Source' */
  real_T B_0_8_0;                      /* '<Root>/Gain1' */
} BlockIO;

/* Block states (auto storage) for system '<Root>' */
typedef struct {
  struct {
    void *LoggedData;
  } Scope_PWORK;                       /* '<Root>/Scope' */

  struct {
    void *LoggedData;
  } Scope1_PWORK;                      /* '<Root>/Scope1' */
} D_Work;

/* Continuous states (auto storage) */
typedef struct {
  real_T StateSpace_CSTATE[6];         /* '<S7>/State-Space' */
} ContinuousStates;

/* State derivatives (auto storage) */
typedef struct {
  real_T StateSpace_CSTATE[6];         /* '<S7>/State-Space' */
} StateDerivatives;

/* State disabled  */
typedef struct {
  boolean_T StateSpace_CSTATE[6];      /* '<S7>/State-Space' */
} StateDisabled;

/* Parameters (auto storage) */
struct Parameters_ {
  real_T P_0[11];                      /* Computed Parameter: P_0
                                        * Referenced by: '<S7>/State-Space'
                                        */
  real_T P_2[3];                       /* Computed Parameter: P_2
                                        * Referenced by: '<S7>/State-Space'
                                        */
  real_T P_4[6];                       /* Expression: S.x0
                                        * Referenced by: '<S7>/State-Space'
                                        */
  real_T P_5;                          /* Expression: 1
                                        * Referenced by: '<S1>/do not delete this gain'
                                        */
  real_T P_6;                          /* Expression: 1/(424.4e3*sqrt(2))
                                        * Referenced by: '<Root>/Gain'
                                        */
  real_T P_7;                          /* Expression: 1
                                        * Referenced by: '<S2>/do not delete this gain'
                                        */
  real_T P_8;                          /* Expression: 1/(424.4e3*sqrt(2))
                                        * Referenced by: '<Root>/Gain1'
                                        */
  real_T P_9;                          /* Expression: Amplitude
                                        * Referenced by: '<S3>/Source'
                                        */
  real_T P_10;                         /* Expression: 0
                                        * Referenced by: '<S3>/Source'
                                        */
  real_T P_11;                         /* Expression: 2*pi*Frequency
                                        * Referenced by: '<S3>/Source'
                                        */
  real_T P_12;                         /* Expression: Phase*pi/180
                                        * Referenced by: '<S3>/Source'
                                        */
};

extern Parameters rtDefaultParameters; /* parameters */

#endif                                 /* RTW_HEADER_practice1_acc_h_ */
