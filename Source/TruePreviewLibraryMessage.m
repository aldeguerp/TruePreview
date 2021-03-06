/*
 * Copyright (c) 2009-2011, Jim Riggs, Christian Serving, L.L.C.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are
 * met:
 *     * Redistributions of source code must retain the above copyright
 *       notice, this list of conditions and the following disclaimer.
 *     * Redistributions in binary form must reproduce the above
 *       copyright notice, this list of conditions and the following
 *       disclaimer in the documentation and/or other materials provided
 *       with the distribution.
 *     * Neither the name of Christian Serving, L.L.C. nor the names of
 *       its contributors may be used to endorse or promote products
 *       derived from this software without specific prior written
 *       permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 * HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import "TruePreviewLibraryMessage.h"

@implementation TruePreviewLibraryMessage

#pragma mark Instance methods

- (NSMutableDictionary*)truePreviewSettings {
  TRUEPREVIEW_LOG();
  
  NSMutableDictionary* theSettings = [NSMutableDictionary dictionaryWithObjectsAndKeys:
    [[NSUserDefaults standardUserDefaults] objectForKey:@"TruePreviewDelay"], @"delay",
    [[NSUserDefaults standardUserDefaults] objectForKey:@"TruePreviewReply"], @"reply",
    [[NSUserDefaults standardUserDefaults] objectForKey:@"TruePreviewForward"], @"forward",
    [[NSUserDefaults standardUserDefaults] objectForKey:@"TruePreviewWindow"], @"window",
    [[NSUserDefaults standardUserDefaults] objectForKey:@"TruePreviewScroll"], @"scroll",
    nil
  ];
  NSMutableDictionary* theAccountSettings = [
    [[NSUserDefaults standardUserDefaults] objectForKey:@"TruePreviewAccountSettings"]
    objectForKey:[[self account] displayName]
  ];
  
  if (theAccountSettings != nil) {
    for (id theKey in [NSArray arrayWithObjects:@"delay", @"reply", @"forward", @"window", @"scroll", nil]) {
      id theValue = [theAccountSettings objectForKey:theKey];
      
      if ((theValue != nil) && ([theValue intValue] != TRUEPREVIEW_DELAY_DEFAULT)) {
        [theSettings setObject:theValue forKey:theKey];
      }
    }
  }
  
  return theSettings;
}

@end
