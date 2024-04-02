/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.c
  * @brief          : Main program body
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2024 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */
/* USER CODE END Header */
/* Includes ------------------------------------------------------------------*/
#include "main.h"
#include <stdio.h>
#include <string.h>
/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */

/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */

/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/
ADC_HandleTypeDef hadc1;

SPI_HandleTypeDef hspi1;

UART_HandleTypeDef huart2;

/* USER CODE BEGIN PV */

/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MX_GPIO_Init(void);
static void MX_ADC1_Init(void);
static void MX_SPI1_Init(void);
static void MX_USART2_UART_Init(void);
/* USER CODE BEGIN PFP */

/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */

void UART_SendString(const char *str) {
    while (*str) {
        while (!(USART2->SR & USART_SR_TXE));
        USART2->DR = *str++;
    }
}

void generate_wave_case1(void) {
	uint8_t myData[2];
	uint16_t adc_Value = 0;
	uint16_t adc_array[80];
	char msg[16];

	// Define a global index variable to keep track of the position in the array
	uint8_t adc_index = 0;
    // Code for generating wave for case 1
	  for (uint16_t voltage = 500; voltage <= 4000; voltage +=100) // Decrement voltage in steps
		 {
	   myData[0] = (voltage >> 8) | 0x30; // First byte (configuration bits + MSB)
	   myData[1] = voltage & 0xFF;        // Second byte (LSB)
	   HAL_GPIO_WritePin(GPIOB, GPIO_PIN_4, GPIO_PIN_SET);
	   HAL_GPIO_WritePin(GPIOB, GPIO_PIN_10, GPIO_PIN_RESET);
	   HAL_SPI_Transmit(&hspi1, myData, sizeof(myData), HAL_MAX_DELAY);
	   HAL_GPIO_WritePin(GPIOB, GPIO_PIN_10, GPIO_PIN_SET);
	   HAL_GPIO_WritePin(GPIOB, GPIO_PIN_4, GPIO_PIN_RESET);
	  HAL_ADC_Start(&hadc1);

	 // Wait for ADC conversion to complete
	 HAL_ADC_PollForConversion(&hadc1, HAL_MAX_DELAY);

	 // Read ADC value
	 adc_Value = HAL_ADC_GetValue(&hadc1);
	 adc_array[adc_index++] = adc_Value;
		 }
	  for (uint16_t voltage = 4000; voltage > 0; voltage -=100) // Decrement voltage in steps
		 {
	   myData[0] = (voltage >> 8) | 0x30; // First byte (configuration bits + MSB)
	   myData[1] = voltage & 0xFF;        // Second byte (LSB)
	   HAL_GPIO_WritePin(GPIOB, GPIO_PIN_4, GPIO_PIN_SET);
	   HAL_GPIO_WritePin(GPIOB, GPIO_PIN_10, GPIO_PIN_RESET);
	   HAL_SPI_Transmit(&hspi1, myData, sizeof(myData), HAL_MAX_DELAY);
	   HAL_GPIO_WritePin(GPIOB, GPIO_PIN_10, GPIO_PIN_SET);
	   HAL_GPIO_WritePin(GPIOB, GPIO_PIN_4, GPIO_PIN_RESET);
	  HAL_ADC_Start(&hadc1);

	 // Wait for ADC conversion to complete
	 HAL_ADC_PollForConversion(&hadc1, HAL_MAX_DELAY);

	 // Read ADC value
	 adc_Value = HAL_ADC_GetValue(&hadc1);
	 adc_array[adc_index++] = adc_Value;
		 }
		for (int i = 0; i < sizeof(adc_array) / sizeof(adc_array[0]); i++) {
		    sprintf(msg, "%hu\r\n", adc_array[i]); // Format current ADC value
		    HAL_UART_Transmit(&huart2, (uint8_t *)msg, strlen(msg), HAL_MAX_DELAY); // Transmit formatted value via UART
		}
}

void generate_wave_case2(void) {
	uint8_t myData[2];
	uint16_t adc_Value = 0;
	uint16_t adc_array[160];
	char msg[16];
	uint8_t adc_index = 0;
    // Code for generating wave for case 2
	for (uint16_t voltage = 2100; voltage <= 4000; voltage +=100) // Increment voltage in steps
	 {
	   // Construct SPI data
	   myData[0] = (voltage >> 8) | 0x30; // First byte (configuration bits + MSB)
	   myData[1] = voltage & 0xFF;        // Second byte (LSB)

	   // Set CS pin low to select MCP4921
	   HAL_GPIO_WritePin(GPIOB, GPIO_PIN_4, GPIO_PIN_SET);
	   HAL_GPIO_WritePin(GPIOB, GPIO_PIN_10, GPIO_PIN_RESET);

	   // Transmit SPI data
	   HAL_SPI_Transmit(&hspi1, myData, sizeof(myData), HAL_MAX_DELAY);

	   // Set CS pin high to deselect MCP4921
	   HAL_GPIO_WritePin(GPIOB, GPIO_PIN_10, GPIO_PIN_SET);
	   HAL_GPIO_WritePin(GPIOB, GPIO_PIN_4, GPIO_PIN_RESET);
	  HAL_ADC_Start(&hadc1);

	 // Wait for ADC conversion to complete
	 HAL_ADC_PollForConversion(&hadc1, HAL_MAX_DELAY);

	 // Read ADC value
	 adc_Value = HAL_ADC_GetValue(&hadc1);
	 adc_array[adc_index++] = adc_Value;
	 }
	for (uint16_t voltage = 4000; voltage > 2000; voltage -=100) // Increment voltage in steps
	 {
	   // Construct SPI data
	   myData[0] = (voltage >> 8) | 0x30; // First byte (configuration bits + MSB)
	   myData[1] = voltage & 0xFF;        // Second byte (LSB)

	   // Set CS pin low to select MCP4921
	   HAL_GPIO_WritePin(GPIOB, GPIO_PIN_4, GPIO_PIN_SET);
	   HAL_GPIO_WritePin(GPIOB, GPIO_PIN_10, GPIO_PIN_RESET);

	   // Transmit SPI data
	   HAL_SPI_Transmit(&hspi1, myData, sizeof(myData), HAL_MAX_DELAY);

	   // Set CS pin high to deselect MCP4921
	   HAL_GPIO_WritePin(GPIOB, GPIO_PIN_10, GPIO_PIN_SET);
	   HAL_GPIO_WritePin(GPIOB, GPIO_PIN_4, GPIO_PIN_RESET);
		  HAL_ADC_Start(&hadc1);

		 // Wait for ADC conversion to complete
		 HAL_ADC_PollForConversion(&hadc1, HAL_MAX_DELAY);

		 // Read ADC value
		 adc_Value = HAL_ADC_GetValue(&hadc1);
		 adc_array[adc_index++] = adc_Value;
	 }
	for (uint16_t voltage = 2100; voltage <= 4000; voltage +=100) // Increment voltage in steps
	 {
	   // Construct SPI data
	   myData[0] = (voltage >> 8) | 0x30; // First byte (configuration bits + MSB)
	   myData[1] = voltage & 0xFF;        // Second byte (LSB)

	   // Set CS pin low to select MCP4921
	   HAL_GPIO_WritePin(GPIOB, GPIO_PIN_4, GPIO_PIN_SET);
	   HAL_GPIO_WritePin(GPIOB, GPIO_PIN_10, GPIO_PIN_RESET);

	   // Transmit SPI data
	   HAL_SPI_Transmit(&hspi1, myData, sizeof(myData), HAL_MAX_DELAY);

	   // Set CS pin high to deselect MCP4921
	   HAL_GPIO_WritePin(GPIOB, GPIO_PIN_10, GPIO_PIN_SET);
	   HAL_GPIO_WritePin(GPIOB, GPIO_PIN_4, GPIO_PIN_RESET);
		  HAL_ADC_Start(&hadc1);

		 // Wait for ADC conversion to complete
		 HAL_ADC_PollForConversion(&hadc1, HAL_MAX_DELAY);

		 // Read ADC value
		 adc_Value = HAL_ADC_GetValue(&hadc1);
		 adc_array[adc_index++] = adc_Value;
	 }
	for (uint16_t voltage = 4000; voltage > 2000; voltage -=100) // Increment voltage in steps
	 {
	   // Construct SPI data
	   myData[0] = (voltage >> 8) | 0x30; // First byte (configuration bits + MSB)
	   myData[1] = voltage & 0xFF;        // Second byte (LSB)

	   // Set CS pin low to select MCP4921
	   HAL_GPIO_WritePin(GPIOB, GPIO_PIN_4, GPIO_PIN_SET);
	   HAL_GPIO_WritePin(GPIOB, GPIO_PIN_10, GPIO_PIN_RESET);

	   // Transmit SPI data
	   HAL_SPI_Transmit(&hspi1, myData, sizeof(myData), HAL_MAX_DELAY);

	   // Set CS pin high to deselect MCP4921
	   HAL_GPIO_WritePin(GPIOB, GPIO_PIN_10, GPIO_PIN_SET);
	   HAL_GPIO_WritePin(GPIOB, GPIO_PIN_4, GPIO_PIN_RESET);
		  HAL_ADC_Start(&hadc1);

		 // Wait for ADC conversion to complete
		 HAL_ADC_PollForConversion(&hadc1, HAL_MAX_DELAY);

		 // Read ADC value
		 adc_Value = HAL_ADC_GetValue(&hadc1);
		 adc_array[adc_index++] = adc_Value;
	 }
	for (uint16_t voltage = 2000; voltage > 0; voltage -=100) // Increment voltage in steps
	 {
	   // Construct SPI data
	   myData[0] = (voltage >> 8) | 0x30; // First byte (configuration bits + MSB)
	   myData[1] = voltage & 0xFF;        // Second byte (LSB)

	   // Set CS pin low to select MCP4921
	   HAL_GPIO_WritePin(GPIOB, GPIO_PIN_4, GPIO_PIN_SET);
	   HAL_GPIO_WritePin(GPIOB, GPIO_PIN_10, GPIO_PIN_RESET);

	   // Transmit SPI data
	   HAL_SPI_Transmit(&hspi1, myData, sizeof(myData), HAL_MAX_DELAY);

	   // Set CS pin high to deselect MCP4921
	   HAL_GPIO_WritePin(GPIOB, GPIO_PIN_10, GPIO_PIN_SET);
	   HAL_GPIO_WritePin(GPIOB, GPIO_PIN_4, GPIO_PIN_RESET);
		  HAL_ADC_Start(&hadc1);

		 // Wait for ADC conversion to complete
		 HAL_ADC_PollForConversion(&hadc1, HAL_MAX_DELAY);

		 // Read ADC value
		 adc_Value = HAL_ADC_GetValue(&hadc1);
		 adc_array[adc_index++] = adc_Value;
	 }
	for (uint16_t voltage = 100; voltage <= 2000; voltage +=100) // Increment voltage in steps
	 {
	   // Construct SPI data
	   myData[0] = (voltage >> 8) | 0x30; // First byte (configuration bits + MSB)
	   myData[1] = voltage & 0xFF;        // Second byte (LSB)

	   // Set CS pin low to select MCP4921
	   HAL_GPIO_WritePin(GPIOB, GPIO_PIN_4, GPIO_PIN_SET);
	   HAL_GPIO_WritePin(GPIOB, GPIO_PIN_10, GPIO_PIN_RESET);

	   // Transmit SPI data
	   HAL_SPI_Transmit(&hspi1, myData, sizeof(myData), HAL_MAX_DELAY);

	   // Set CS pin high to deselect MCP4921
	   HAL_GPIO_WritePin(GPIOB, GPIO_PIN_10, GPIO_PIN_SET);
	   HAL_GPIO_WritePin(GPIOB, GPIO_PIN_4, GPIO_PIN_RESET);
		  HAL_ADC_Start(&hadc1);

		 // Wait for ADC conversion to complete
		 HAL_ADC_PollForConversion(&hadc1, HAL_MAX_DELAY);

		 // Read ADC value
		 adc_Value = HAL_ADC_GetValue(&hadc1);
		 adc_array[adc_index++] = adc_Value;
	 }
	for (uint16_t voltage = 2000; voltage > 0; voltage -=100) // Increment voltage in steps
	 {
	   // Construct SPI data
	   myData[0] = (voltage >> 8) | 0x30; // First byte (configuration bits + MSB)
	   myData[1] = voltage & 0xFF;        // Second byte (LSB)

	   // Set CS pin low to select MCP4921
	   HAL_GPIO_WritePin(GPIOB, GPIO_PIN_4, GPIO_PIN_SET);
	   HAL_GPIO_WritePin(GPIOB, GPIO_PIN_10, GPIO_PIN_RESET);

	   // Transmit SPI data
	   HAL_SPI_Transmit(&hspi1, myData, sizeof(myData), HAL_MAX_DELAY);

	   // Set CS pin high to deselect MCP4921
	   HAL_GPIO_WritePin(GPIOB, GPIO_PIN_10, GPIO_PIN_SET);
	   HAL_GPIO_WritePin(GPIOB, GPIO_PIN_4, GPIO_PIN_RESET);
		  HAL_ADC_Start(&hadc1);

		 // Wait for ADC conversion to complete
		 HAL_ADC_PollForConversion(&hadc1, HAL_MAX_DELAY);

		 // Read ADC value
		 adc_Value = HAL_ADC_GetValue(&hadc1);
		 adc_array[adc_index++] = adc_Value;
	 }
	for (uint16_t voltage = 100; voltage <= 2000; voltage +=100) // Increment voltage in steps
	 {
	   // Construct SPI data
	   myData[0] = (voltage >> 8) | 0x30; // First byte (configuration bits + MSB)
	   myData[1] = voltage & 0xFF;        // Second byte (LSB)

	   // Set CS pin low to select MCP4921
	   HAL_GPIO_WritePin(GPIOB, GPIO_PIN_4, GPIO_PIN_SET);
	   HAL_GPIO_WritePin(GPIOB, GPIO_PIN_10, GPIO_PIN_RESET);

	   // Transmit SPI data
	   HAL_SPI_Transmit(&hspi1, myData, sizeof(myData), HAL_MAX_DELAY);

	   // Set CS pin high to deselect MCP4921
	   HAL_GPIO_WritePin(GPIOB, GPIO_PIN_10, GPIO_PIN_SET);
	   HAL_GPIO_WritePin(GPIOB, GPIO_PIN_4, GPIO_PIN_RESET);
		  HAL_ADC_Start(&hadc1);

		 // Wait for ADC conversion to complete
		 HAL_ADC_PollForConversion(&hadc1, HAL_MAX_DELAY);

		 // Read ADC value
		 adc_Value = HAL_ADC_GetValue(&hadc1);
		 adc_array[adc_index++] = adc_Value;
	 }
	for (int i = 0; i < sizeof(adc_array) / sizeof(adc_array[0]); i++) {
	    sprintf(msg, "%hu\r\n", adc_array[i]); // Format current ADC value
	    HAL_UART_Transmit(&huart2, (uint8_t *)msg, strlen(msg), HAL_MAX_DELAY); // Transmit formatted value via UART
	}
}

void generate_wave_case3(void){
	uint8_t myData[2];
	uint16_t adc_Value = 0;
//	uint16_t adc_array[160];
//	uint8_t loopCount = 0;
//	char msg[16];
//	uint8_t adc_index = 0;
	while(1)
	{
	  for (uint16_t voltage = 500; voltage <= 4000; voltage +=500) // Decrement voltage in steps
		 {
	   myData[0] = (voltage >> 8) | 0x30; // First byte (configuration bits + MSB)
	   myData[1] = voltage & 0xFF;        // Second byte (LSB)
	   HAL_GPIO_WritePin(GPIOB, GPIO_PIN_4, GPIO_PIN_SET);
	   HAL_GPIO_WritePin(GPIOB, GPIO_PIN_10, GPIO_PIN_RESET);
	   HAL_SPI_Transmit(&hspi1, myData, sizeof(myData), HAL_MAX_DELAY);
	   HAL_GPIO_WritePin(GPIOB, GPIO_PIN_10, GPIO_PIN_SET);
	   HAL_GPIO_WritePin(GPIOB, GPIO_PIN_4, GPIO_PIN_RESET);
//		  HAL_ADC_Start(&hadc1);
//
//		 // Wait for ADC conversion to complete
//		 HAL_ADC_PollForConversion(&hadc1, HAL_MAX_DELAY);
//
//		 // Read ADC value
//		 adc_Value = HAL_ADC_GetValue(&hadc1);
//		 adc_array[adc_index++] = adc_Value;
		 }
	  for (uint16_t voltage = 4000; voltage > 0; voltage -=500) // Decrement voltage in steps
		 {
	   myData[0] = (voltage >> 8) | 0x30; // First byte (configuration bits + MSB)
	   myData[1] = voltage & 0xFF;        // Second byte (LSB)
	   HAL_GPIO_WritePin(GPIOB, GPIO_PIN_4, GPIO_PIN_SET);
	   HAL_GPIO_WritePin(GPIOB, GPIO_PIN_10, GPIO_PIN_RESET);
	   HAL_SPI_Transmit(&hspi1, myData, sizeof(myData), HAL_MAX_DELAY);
	   HAL_GPIO_WritePin(GPIOB, GPIO_PIN_10, GPIO_PIN_SET);
	   HAL_GPIO_WritePin(GPIOB, GPIO_PIN_4, GPIO_PIN_RESET);
//		  HAL_ADC_Start(&hadc1);
//
//		 // Wait for ADC conversion to complete
//		 HAL_ADC_PollForConversion(&hadc1, HAL_MAX_DELAY);
//
//		 // Read ADC value
//		 adc_Value = HAL_ADC_GetValue(&hadc1);
//		 adc_array[adc_index++] = adc_Value;
		 }
//	  loopCount++;
	}
//	for (int i = 0; i < sizeof(adc_array) / sizeof(adc_array[0]); i++) {
//	    sprintf(msg, "%hu\r\n", adc_array[i]); // Format current ADC value
//	    HAL_UART_Transmit(&huart2, (uint8_t *)msg, strlen(msg), HAL_MAX_DELAY); // Transmit formatted value via UART
//	}
}
/* USER CODE END 0 */

/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{
  /* USER CODE BEGIN 1 */

  /* USER CODE END 1 */

  /* MCU Configuration--------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();

  /* USER CODE BEGIN Init */

  /* USER CODE END Init */

  /* Configure the system clock */
  SystemClock_Config();

  /* USER CODE BEGIN SysInit */

  /* USER CODE END SysInit */

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_ADC1_Init();
  MX_SPI1_Init();
  MX_USART2_UART_Init();
  /* USER CODE BEGIN 2 */

  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
  while (1)
  {
    /* USER CODE END WHILE */
	  if (USART2->SR & USART_SR_RXNE) {
	              // Read the received character
			  char received_char = USART2->DR;

			  // Process the received character
			  switch (received_char) {
				  case 'A':
					  UART_SendString("Generating wave for case 1\r\n");
					  generate_wave_case1();
					  break;
				  case 'B':
					  UART_SendString("Generating wave for case 2\r\n");
					  generate_wave_case2();
					  break;
				  case 'C':
					  UART_SendString("Generating wave for case 3\r\n");
					  generate_wave_case3();
					  break;
				  default:
					  UART_SendString("Invalid command. Please enter 'A' or 'B' or 'C'\r\n");
					  break;
			  }
		  }
    /* USER CODE BEGIN 3 */
  }
  /* USER CODE END 3 */
}

/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};
  RCC_PeriphCLKInitTypeDef PeriphClkInit = {0};

  /** Initializes the RCC Oscillators according to the specified parameters
  * in the RCC_OscInitTypeDef structure.
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI;
  RCC_OscInitStruct.HSIState = RCC_HSI_ON;
  RCC_OscInitStruct.HSICalibrationValue = RCC_HSICALIBRATION_DEFAULT;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSI_DIV2;
  RCC_OscInitStruct.PLL.PLLMUL = RCC_PLL_MUL14;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }

  /** Initializes the CPU, AHB and APB buses clocks
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV2;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_2) != HAL_OK)
  {
    Error_Handler();
  }
  PeriphClkInit.PeriphClockSelection = RCC_PERIPHCLK_ADC;
  PeriphClkInit.AdcClockSelection = RCC_ADCPCLK2_DIV4;
  if (HAL_RCCEx_PeriphCLKConfig(&PeriphClkInit) != HAL_OK)
  {
    Error_Handler();
  }
}

/**
  * @brief ADC1 Initialization Function
  * @param None
  * @retval None
  */
static void MX_ADC1_Init(void)
{

  /* USER CODE BEGIN ADC1_Init 0 */

  /* USER CODE END ADC1_Init 0 */

  ADC_ChannelConfTypeDef sConfig = {0};

  /* USER CODE BEGIN ADC1_Init 1 */

  /* USER CODE END ADC1_Init 1 */

  /** Common config
  */
  hadc1.Instance = ADC1;
  hadc1.Init.ScanConvMode = ADC_SCAN_DISABLE;
  hadc1.Init.ContinuousConvMode = DISABLE;
  hadc1.Init.DiscontinuousConvMode = DISABLE;
  hadc1.Init.ExternalTrigConv = ADC_SOFTWARE_START;
  hadc1.Init.DataAlign = ADC_DATAALIGN_RIGHT;
  hadc1.Init.NbrOfConversion = 1;
  if (HAL_ADC_Init(&hadc1) != HAL_OK)
  {
    Error_Handler();
  }

  /** Configure Regular Channel
  */
  sConfig.Channel = ADC_CHANNEL_4;
  sConfig.Rank = ADC_REGULAR_RANK_1;
  sConfig.SamplingTime = ADC_SAMPLETIME_1CYCLE_5;
  if (HAL_ADC_ConfigChannel(&hadc1, &sConfig) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN ADC1_Init 2 */

  /* USER CODE END ADC1_Init 2 */

}

/**
  * @brief SPI1 Initialization Function
  * @param None
  * @retval None
  */
static void MX_SPI1_Init(void)
{

  /* USER CODE BEGIN SPI1_Init 0 */

  /* USER CODE END SPI1_Init 0 */

  /* USER CODE BEGIN SPI1_Init 1 */

  /* USER CODE END SPI1_Init 1 */
  /* SPI1 parameter configuration*/
  hspi1.Instance = SPI1;
  hspi1.Init.Mode = SPI_MODE_MASTER;
  hspi1.Init.Direction = SPI_DIRECTION_2LINES;
  hspi1.Init.DataSize = SPI_DATASIZE_8BIT;
  hspi1.Init.CLKPolarity = SPI_POLARITY_LOW;
  hspi1.Init.CLKPhase = SPI_PHASE_1EDGE;
  hspi1.Init.NSS = SPI_NSS_SOFT;
  hspi1.Init.BaudRatePrescaler = SPI_BAUDRATEPRESCALER_4;
  hspi1.Init.FirstBit = SPI_FIRSTBIT_MSB;
  hspi1.Init.TIMode = SPI_TIMODE_DISABLE;
  hspi1.Init.CRCCalculation = SPI_CRCCALCULATION_DISABLE;
  hspi1.Init.CRCPolynomial = 10;
  if (HAL_SPI_Init(&hspi1) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN SPI1_Init 2 */

  /* USER CODE END SPI1_Init 2 */

}

/**
  * @brief USART2 Initialization Function
  * @param None
  * @retval None
  */
static void MX_USART2_UART_Init(void)
{

  /* USER CODE BEGIN USART2_Init 0 */

  /* USER CODE END USART2_Init 0 */

  /* USER CODE BEGIN USART2_Init 1 */

  /* USER CODE END USART2_Init 1 */
  huart2.Instance = USART2;
  huart2.Init.BaudRate = 115200;
  huart2.Init.WordLength = UART_WORDLENGTH_8B;
  huart2.Init.StopBits = UART_STOPBITS_1;
  huart2.Init.Parity = UART_PARITY_NONE;
  huart2.Init.Mode = UART_MODE_TX_RX;
  huart2.Init.HwFlowCtl = UART_HWCONTROL_NONE;
  huart2.Init.OverSampling = UART_OVERSAMPLING_16;
  if (HAL_UART_Init(&huart2) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN USART2_Init 2 */

  /* USER CODE END USART2_Init 2 */

}

/**
  * @brief GPIO Initialization Function
  * @param None
  * @retval None
  */
static void MX_GPIO_Init(void)
{
  GPIO_InitTypeDef GPIO_InitStruct = {0};
/* USER CODE BEGIN MX_GPIO_Init_1 */
/* USER CODE END MX_GPIO_Init_1 */

  /* GPIO Ports Clock Enable */
  __HAL_RCC_GPIOA_CLK_ENABLE();
  __HAL_RCC_GPIOB_CLK_ENABLE();

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(GPIOB, GPIO_PIN_10|GPIO_PIN_4, GPIO_PIN_RESET);

  /*Configure GPIO pins : PB10 PB4 */
  GPIO_InitStruct.Pin = GPIO_PIN_10|GPIO_PIN_4;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);

/* USER CODE BEGIN MX_GPIO_Init_2 */
/* USER CODE END MX_GPIO_Init_2 */
}

/* USER CODE BEGIN 4 */

/* USER CODE END 4 */

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */
  __disable_irq();
  while (1)
  {
  }
  /* USER CODE END Error_Handler_Debug */
}

#ifdef  USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */
