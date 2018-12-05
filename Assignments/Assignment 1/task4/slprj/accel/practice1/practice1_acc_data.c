/*
 * practice1_acc_data.c
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

#include "practice1_acc.h"
#include "practice1_acc_private.h"

/* Block parameters (auto storage) */
Parameters rtDefaultParameters = {
  /*  Computed Parameter: P_0
   * Referenced by: '<S7>/State-Space'
   */
  { 3.7700282752120643E+001, -8.4860828241683630E+003, -4.7118727507875420E+001,
    -1.2566370614359172E+000, 2.3023846380623944E-001, -2.3208434018991929E+006,
    5.0180565340192338E+000, -1.2781551525942101E+002, -5.0180565340192338E+000,
    -2.3208434018991929E+006, 2.3208434018991929E+006 },

  /*  Computed Parameter: P_2
   * Referenced by: '<S7>/State-Space'
   */
  { 1.0, 1.0, 1.0 },

  /*  Expression: S.x0
   * Referenced by: '<S7>/State-Space'
   */
  { 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 },
  1.0,                                 /* Expression: 1
                                        * Referenced by: '<S1>/do not delete this gain'
                                        */
  1.6661328491671713E-006,             /* Expression: 1/(424.4e3*sqrt(2))
                                        * Referenced by: '<Root>/Gain'
                                        */
  1.0,                                 /* Expression: 1
                                        * Referenced by: '<S2>/do not delete this gain'
                                        */
  1.6661328491671713E-006,             /* Expression: 1/(424.4e3*sqrt(2))
                                        * Referenced by: '<Root>/Gain1'
                                        */
  6.0019223587114154E+005,             /* Expression: Amplitude
                                        * Referenced by: '<S3>/Source'
                                        */
  0.0,                                 /* Expression: 0
                                        * Referenced by: '<S3>/Source'
                                        */
  3.7699111843077515E+002,             /* Expression: 2*pi*Frequency
                                        * Referenced by: '<S3>/Source'
                                        */
  0.0                                  /* Expression: Phase*pi/180
                                        * Referenced by: '<S3>/Source'
                                        */
};
