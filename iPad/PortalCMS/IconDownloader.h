

@class NieuwsView;

@protocol IconDownloaderDelegate;

@interface IconDownloader : NSObject
{
    NSIndexPath *indexPathInTableView;
    id <IconDownloaderDelegate> delegate;
    NSMutableData *activeDownload;
    NSURLConnection *imageConnection;
    NieuwsView *objNiews;
}
@property (nonatomic, retain) NSIndexPath *indexPathInTableView;
@property (nonatomic, assign) id <IconDownloaderDelegate> delegate;
@property (nonatomic, retain) NSMutableData *activeDownload;
@property (nonatomic, retain) NSURLConnection *imageConnection;

- (void)startDownload:(NSString*)str;
- (void)cancelDownload;
@end

@protocol IconDownloaderDelegate 

- (void)appImageDidLoad:(NSIndexPath *)indexPath:(UIImage*)image;

@end