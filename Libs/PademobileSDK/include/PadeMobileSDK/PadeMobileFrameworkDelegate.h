//
//  PadeMobileFrameworkDelegate.h
//  PadeMobileSDK
//
//  Created by Luis Alejandro Rangel Sánchez on 02/02/13.
//  Copyright (c) 2013 Vibebrand. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef struct  {
    bool valid;
    double latitude;
    double longitude;
    NSString * country;
} GeoRef;

@protocol PadeMobileFrameworkDelegate <NSObject>

/* Notifica que se esta esperando el OTP*/

- (void) requieredOTP;

/* Si es el pararametro de retorno es verdadero, la libreria se encarga de notificar el error visualmente al usuario,
 si es falso no genera las ventanas de error y quien implemente la libreria se debera hacer cargo de mostrar los errores en pantalla */

- (BOOL) autoHandleError: (NSString *) error;

/* Notifica si la transaccion fue llevada a cabo satisfactoriamente o no */

- (void) transactionCompleted: (BOOL) correctly;

@optional

/* Obtiene un punto geografico de referencia, para la autoselecion del pais en el menu */

- (GeoRef *) getGeoReference;

@end
