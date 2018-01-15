/*
 * Copyright (C) 2014 Advanced Card Systems Ltd. All Rights Reserved.
 *
 * This software is the confidential and proprietary information of Advanced
 * Card Systems Ltd. ("Confidential Information").  You shall not disclose such
 * Confidential Information and shall use it only in accordance with the terms
 * of the license agreement you entered into with ACS.
 */

#import "ABTBluetoothReader.h"

/**
 * The <code>ABTAcr3901us1Reader</code> class represents ACR3901U-S1 reader.
 * @author  Godfrey Chung
 * @version 1.0, 25 Jul 2014
 */
@interface ABTAcr3901us1Reader : ABTBluetoothReader

/**
 * Gets the battery status. When the Bluetooth reader returns the battery
 * status, it calls the
 * ABTBluetoothReaderDelegate::bluetoothReader:didChangeBatteryStatus:error:
 * method of its delegate object.
 * @return <code>YES</code> if the reader is attached, otherwise
 *         <code>NO</code>.
 */
- (BOOL)getBatteryStatus;

@end
