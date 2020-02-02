//
//  main.m
//  TaggedPointer
//
//  Created by Sun on 2020/1/31.
//  Copyright © 2020 sun. All rights reserved.
//

#import <Foundation/Foundation.h>



#if TARGET_OS_OSX && __x86_64__
    // mac 开发
#   define OBJC_MSB_TAGGED_POINTERS 0
#else
    // iOS 开发
#   define OBJC_MSB_TAGGED_POINTERS 1
#endif


#if OBJC_MSB_TAGGED_POINTERS
    // iOS 开发
#   define _OBJC_TAG_MASK (1UL<<63)
#else
    // mac 开发
#   define _OBJC_TAG_MASK 1UL
#endif

// 判断是否为 TaggedPointer
BOOL isTaggedPointer(id pointer) {
    return ((uintptr_t)pointer & _OBJC_TAG_MASK) == _OBJC_TAG_MASK;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
