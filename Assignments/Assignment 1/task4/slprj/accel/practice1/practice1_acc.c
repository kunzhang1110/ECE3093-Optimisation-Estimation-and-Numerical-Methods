/*
 * This file is not available for use in any application other than as a
 * MATLAB(R) MEX file for use with the Simulink(R) product.
 */

/*
 * practice1_acc.c
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
#include <math.h>
#include "practice1_acc.h"
#include "practice1_acc_private.h"
#include <stdio.h>
#include "simstruc.h"
#include "fixedpoint.h"
#define CodeFormat                     S-Function
#define AccDefine1                     Accelerator_S-Function

/* Outputs for root system: '<Root>' */
static void mdlOutputs(SimStruct *S, int_T tid)
{
  /* local block i/o variables */
  real_T B_0_0_0[2];

  /* StateSpace: '<S7>/State-Space' */
  {
    B_0_0_0[0] = (((Parameters *) ssGetDefaultParam(S))->P_2[0])*
      ((ContinuousStates *) ssGetContStates(S))->StateSpace_CSTATE[1]
      + (((Parameters *) ssGetDefaultParam(S))->P_2[1])*((ContinuousStates *)
      ssGetContStates(S))->StateSpace_CSTATE[3];
    B_0_0_0[1] = (((Parameters *) ssGetDefaultParam(S))->P_2[2])*
      ((ContinuousStates *) ssGetContStates(S))->StateSpace_CSTATE[5];
  }

  ((BlockIO *) _ssGetBlockIO(S))->B_0_8_0 = ((Parameters *) ssGetDefaultParam(S))
    ->P_5 * B_0_0_0[0] * ((Parameters *) ssGetDefaultParam(S))->P_6;

  /* Scope: '<Root>/Scope' */

  /* Call into Simulink for Scope */
  ssCallAccelRunBlock(S, 0, 3, SS_CALL_MDL_OUTPUTS);
  ((BlockIO *) _ssGetBlockIO(S))->B_0_8_0 = ((Parameters *) ssGetDefaultParam(S))
    ->P_7 * B_0_0_0[1] * ((Parameters *) ssGetDefaultParam(S))->P_8;

  /* Scope: '<Root>/Scope1' */

  /* Call into Simulink for Scope */
  ssCallAccelRunBlock(S, 0, 9, SS_CALL_MDL_OUTPUTS);
  ((BlockIO *) _ssGetBlockIO(S))->B_0_13_0 = muDoubleScalarSin(((Parameters *)
    ssGetDefaultParam(S))->P_11 * ssGetTaskTime(S,0) + ((Parameters *)
    ssGetDefaultParam(S))->P_12) * ((Parameters *) ssGetDefaultParam(S))->P_9 +
    ((Parameters *) ssGetDefaultParam(S))->P_10;

  /* tid is required for a uniform function interface.
   * Argument tid is not used in the function. */
  UNUSED_PARAMETER(tid);
}

/* Update for root system: '<Root>' */
#define MDL_UPDATE

static void mdlUpdate(SimStruct *S, int_T tid)
{
  /* tid is required for a uniform function interface.
   * Argument tid is not used in the function. */
  UNUSED_PARAMETER(tid);
}

/* Derivatives for root system: '<Root>' */
#define MDL_DERIVATIVES

static void mdlDerivatives(SimStruct *S)
{
  /* Derivatives for StateSpace: '<S7>/State-Space' */
  {
    ((StateDerivatives *) ssGetdX(S))->StateSpace_CSTATE[0] = (((Parameters *)
      ssGetDefaultParam(S))->P_0[0])*((ContinuousStates *) ssGetContStates(S))
      ->StateSpace_CSTATE[1];
    ((StateDerivatives *) ssGetdX(S))->StateSpace_CSTATE[1] = (((Parameters *)
      ssGetDefaultParam(S))->P_0[1])*((ContinuousStates *) ssGetContStates(S))
      ->StateSpace_CSTATE[0]
      + (((Parameters *) ssGetDefaultParam(S))->P_0[2])*((ContinuousStates *)
      ssGetContStates(S))->StateSpace_CSTATE[1];
    ((StateDerivatives *) ssGetdX(S))->StateSpace_CSTATE[2] = (((Parameters *)
      ssGetDefaultParam(S))->P_0[3])*((ContinuousStates *) ssGetContStates(S))
      ->StateSpace_CSTATE[2]
      + (((Parameters *) ssGetDefaultParam(S))->P_0[4])*((ContinuousStates *)
      ssGetContStates(S))->StateSpace_CSTATE[5];
    ((StateDerivatives *) ssGetdX(S))->StateSpace_CSTATE[3] = (((Parameters *)
      ssGetDefaultParam(S))->P_0[5])*((ContinuousStates *) ssGetContStates(S))
      ->StateSpace_CSTATE[4];
    ((StateDerivatives *) ssGetdX(S))->StateSpace_CSTATE[4] = (((Parameters *)
      ssGetDefaultParam(S))->P_0[6])*((ContinuousStates *) ssGetContStates(S))
      ->StateSpace_CSTATE[3]
      + (((Parameters *) ssGetDefaultParam(S))->P_0[7])*((ContinuousStates *)
      ssGetContStates(S))->StateSpace_CSTATE[4]
      + (((Parameters *) ssGetDefaultParam(S))->P_0[8])*((ContinuousStates *)
      ssGetContStates(S))->StateSpace_CSTATE[5];
    ((StateDerivatives *) ssGetdX(S))->StateSpace_CSTATE[5] = (((Parameters *)
      ssGetDefaultParam(S))->P_0[9])*((ContinuousStates *) ssGetContStates(S))
      ->StateSpace_CSTATE[2]
      + (((Parameters *) ssGetDefaultParam(S))->P_0[10])*((ContinuousStates *)
      ssGetContStates(S))->StateSpace_CSTATE[4];
  }
}

/* Function to initialize sizes */
static void mdlInitializeSizes(SimStruct *S)
{
  /* checksum */
  ssSetChecksumVal(S, 0, 1811911718U);
  ssSetChecksumVal(S, 1, 1058616875U);
  ssSetChecksumVal(S, 2, 457751221U);
  ssSetChecksumVal(S, 3, 3484466595U);

  /* options */
  ssSetOptions(S, SS_OPTION_EXCEPTION_FREE_CODE);

  /* Accelerator check memory map size match for DWork */
  if (ssGetSizeofDWork(S) != sizeof(D_Work)) {
    ssSetErrorStatus(S,"Unexpected error: Internal DWork sizes do "
                     "not match for accelerator mex file.");
  }

  /* Accelerator check memory map size match for BlockIO */
  if (ssGetSizeofGlobalBlockIO(S) != sizeof(BlockIO)) {
    ssSetErrorStatus(S,"Unexpected error: Internal BlockIO sizes do "
                     "not match for accelerator mex file.");
  }

  /* model parameters */
  _ssSetDefaultParam(S, (real_T *) &rtDefaultParameters);
}

/* mdlInitializeSampleTimes function (used to set up function-call connections) */
static void mdlInitializeSampleTimes(SimStruct *S)
{
}

/* Empty mdlTerminate function (never called) */
static void mdlTerminate(SimStruct *S)
{
}

/* MATLAB MEX Glue */
#include "simulink.c"
