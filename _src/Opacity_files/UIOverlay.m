//
//	UIOverlay.m
//	New Image
//
//	Created by Nor Sanavongsay on 10/6/11
//	Copyright 2011 nawDsign
//	This code was generated by Opacity. You may use or modify it in any way.
//

#import "UIOverlay.h"

const CGFloat kUIOverlayWidth = 320.0f;
const CGFloat kUIOverlayHeight = 480.0f;

@implementation UIOverlay


- (id)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		[self setOpaque:NO];
	}
	return self;
}

- (id)initWithCoder:(NSCoder *)coder
{
	self = [super initWithCoder:coder];
	if (self) {
		[self setOpaque:NO];
	}
	return self;
}

- (CGSize)sizeThatFits:(CGSize)size
{
	return CGSizeMake(kUIOverlayWidth, kUIOverlayHeight);
}

- (void)drawRect:(CGRect)dirtyRect
{
	CGRect imageBounds = CGRectMake(0.0f, 0.0f, kUIOverlayWidth, kUIOverlayHeight);
	CGRect bounds = [self bounds];
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGFloat alignStroke;
	CGFloat resolution;
	CGMutablePathRef path;
	CGRect drawRect;
	CGGradientRef gradient;
	NSMutableArray *colors;
	UIColor *color;
	CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();
	CGAffineTransform transform;
	CGRect pathBounds;
	CGFloat locations[2];
	resolution = 0.5f * (bounds.size.width / imageBounds.size.width + bounds.size.height / imageBounds.size.height);
	
	CGContextSaveGState(context);
	CGContextTranslateCTM(context, bounds.origin.x, bounds.origin.y);
	CGContextScaleCTM(context, (bounds.size.width / imageBounds.size.width), (bounds.size.height / imageBounds.size.height));
	
	// Layer 1
	
	alignStroke = 0.0f;
	path = CGPathCreateMutable();
	drawRect = CGRectMake(0.0f, 0.0f, 320.0f, 480.0f);
	drawRect.origin.x = (roundf(resolution * drawRect.origin.x + alignStroke) - alignStroke) / resolution;
	drawRect.origin.y = (roundf(resolution * drawRect.origin.y + alignStroke) - alignStroke) / resolution;
	drawRect.size.width = roundf(resolution * drawRect.size.width) / resolution;
	drawRect.size.height = roundf(resolution * drawRect.size.height) / resolution;
	CGPathAddRect(path, NULL, drawRect);
	colors = [NSMutableArray arrayWithCapacity:2];
	color = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.65f];
	[colors addObject:(id)[color CGColor]];
	locations[0] = 0.0f;
	color = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.33f];
	[colors addObject:(id)[color CGColor]];
	locations[1] = 1.0f;
	gradient = CGGradientCreateWithColors(space, (CFArrayRef)colors, locations);
	CGContextAddPath(context, path);
	CGContextSaveGState(context);
	CGContextEOClip(context);
	pathBounds = CGPathGetPathBoundingBox(path);
	transform = CGAffineTransformMakeTranslation(CGRectGetMidX(pathBounds), CGRectGetMidY(pathBounds));
	transform = CGAffineTransformScale(transform, 0.5f * pathBounds.size.width, 0.5f * pathBounds.size.height);
	CGContextConcatCTM(context, transform);
	CGContextDrawRadialGradient(context, gradient, CGPointZero, 1.0f, CGPointMake(0.0f, 0.0f), 0.0f, (kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation));
	CGContextRestoreGState(context);
	CGGradientRelease(gradient);
	CGPathRelease(path);
	
	CGContextRestoreGState(context);
	CGColorSpaceRelease(space);
}

@end
