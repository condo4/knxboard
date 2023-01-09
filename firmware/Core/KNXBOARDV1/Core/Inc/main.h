/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.h
  * @brief          : Header for main.c file.
  *                   This file contains the common defines of the application.
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2023 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */
/* USER CODE END Header */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __MAIN_H
#define __MAIN_H

#ifdef __cplusplus
extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include "stm32l4xx_hal.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */

/* USER CODE END Includes */

/* Exported types ------------------------------------------------------------*/
/* USER CODE BEGIN ET */

/* USER CODE END ET */

/* Exported constants --------------------------------------------------------*/
/* USER CODE BEGIN EC */

/* USER CODE END EC */

/* Exported macro ------------------------------------------------------------*/
/* USER CODE BEGIN EM */

/* USER CODE END EM */

/* Exported functions prototypes ---------------------------------------------*/
void Error_Handler(void);

/* USER CODE BEGIN EFP */

/* USER CODE END EFP */

/* Private defines -----------------------------------------------------------*/
#define GPIO_DBG_Pin GPIO_PIN_1
#define GPIO_DBG_GPIO_Port GPIOA
#define UART_TX_Pin GPIO_PIN_2
#define UART_TX_GPIO_Port GPIOA
#define GPIO_DBG2_Pin GPIO_PIN_3
#define GPIO_DBG2_GPIO_Port GPIOA
#define KNX_TX_Pin GPIO_PIN_8
#define KNX_TX_GPIO_Port GPIOA
#define KNX_RX_Pin GPIO_PIN_9
#define KNX_RX_GPIO_Port GPIOA
#define KNX_RX_EXTI_IRQn EXTI9_5_IRQn
#define KNX_OK_Pin GPIO_PIN_10
#define KNX_OK_GPIO_Port GPIOA
#define VCC_OK_Pin GPIO_PIN_11
#define VCC_OK_GPIO_Port GPIOA
#define KNX_PROG_BTN_Pin GPIO_PIN_12
#define KNX_PROG_BTN_GPIO_Port GPIOA
#define KNX_PROG_BTN_EXTI_IRQn EXTI15_10_IRQn
#define UART_RX_Pin GPIO_PIN_15
#define UART_RX_GPIO_Port GPIOA
#define KNX_PROG_LED_Pin GPIO_PIN_3
#define KNX_PROG_LED_GPIO_Port GPIOB

/* USER CODE BEGIN Private defines */

/* USER CODE END Private defines */

#ifdef __cplusplus
}
#endif

#endif /* __MAIN_H */
