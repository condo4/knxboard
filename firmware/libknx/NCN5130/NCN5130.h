
/* SERVICES FROM HOST CONTROLLER            */
/*      INTERNAL COMMANDS – DEVICE SPECIFIC */
void U_Reset__req();
void U_State__req();
void U_SetBusy__req();
void U_QuitBusy__req();
void U_Busmon__req();
void U_SetAddress__req(unsigned char addr_low, unsigned char addr_hight);
void U_SetRepetition__req(unsigned char rep_cntrs);
void U_L_DataOffset__req(unsigned char index);
void U_SystemStat__req();
void U_StopMode__req();
void U_ExitStopMode__req();
void U_Ackn__req(bool nack, bool busy, bool addressed);
void U_Configure__req(bool auto_polling, bool crc_ccitt, bool frame_end_marker);
void U_IntRegWr__req(unsigned char address, unsigned char data);
void U_IntRegRd__req(unsigned char address);
void U_PollingState__req(unsigned char slot, unsigned char addr_hight, unsigned char addr_low, unsigned char state);

/*      KNX TRANSMIT DATA COMMANDS */
void U_L_DataStart__req(unsigned char ctrl);
void U_L_DataCont__req(unsigned char index, unsigned char data);
void U_L_DataEnd__req(unsigned char index, unsigned char fcs);
