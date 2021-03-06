#' Convert icnv.output to input for Genome Browser. 
#' 
#' We could add the output to custom tracks on Genome Browser. Remeber to choose 
#' human assembly matches your input data.
#' We color coded the CNVs to make it as consistant as IGV. To show color, 
#' click 'User Track after submission', and edit config to 
#' 'visibility=2 itemRgb="On"'. Color see Github page for more example.
#' 
#' @importFrom grDevices colorRampPalette dev.off pdf
#' @importFrom graphics axis grid legend par plot points
#' @importFrom stats aggregate dnorm dunif kmeans sd
#' @importFrom utils read.table write.table
#' @param chr CNV chromosome. Type integer. 
#' @param icnv.output output from output_list_function
#' @return matrix for Genome browser
#' @examples
#' icnv.output <- output_list(icnv_res=icnv_res0,sampleid=sampname_qc, CN=0, min_size=10000)
#' gb_input <- icnv_output_to_gb(chr=22,icnv.output)
#' write.table(gb_input,file='icnv_res_gb_chr22.tab',quote=FALSE,col.names=FALSE,row.names=FALSE)
#' @export
icnv_output_to_gb <- function(chr=numeric(),icnv.output){
    stopifnot(is.numeric(chr))
    ids <- names(icnv.output)
    colcode <- c('130,0,0','255,0,0',NA,'0,255,0','0,130,0')
    gb.list <- mapply(function(x,id){
        nr <- nrow(x)
        if(nr>0){
            return(cbind(rep(paste0('chr',chr),nr),matrix(x[,c(2,3)],ncol=2),
                rep(id,nr),rep(0,nr),rep('.',nr),
                rep(0,nr),rep(0,nr),colcode[x[,1]+1]))
        }else{
            return(matrix(rep(NA,9),ncol=9))
        }
    },icnv.output,ids,SIMPLIFY = FALSE)
    gb <- do.call(rbind,gb.list)
    ind <- apply(gb, 1, function(x) all(is.na(x)))
    gb <- gb[!ind,]
    return(gb)
}
